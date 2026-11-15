<#
  A tiny static file server for Toolworks, using only what Windows ships.

  Why PowerShell: a Windows user may have no Python, and asking them to install a
  runtime to read a list of tools would be absurd. System.Net.HttpListener is in
  the .NET Framework that comes with Windows.

  It serves one folder, read-only, on the local network. It is not a web server:
  no directory traversal outside -Root, no uploads, no logging to disk.
#>
param(
  [int]$Port = 8731,
  [string]$Root = "."
)

$ErrorActionPreference = "Stop"
$Root = (Resolve-Path $Root).Path
$prefix = "http://+:$Port/"
$listener = New-Object System.Net.HttpListener
$listener.Prefixes.Add($prefix)

try {
  $listener.Start()
} catch {
  # http://+ needs elevation; fall back to localhost only, which does not.
  Write-Host "  (could not bind to all interfaces - falling back to localhost only)" -ForegroundColor Yellow
  $listener = New-Object System.Net.HttpListener
  $listener.Prefixes.Add("http://localhost:$Port/")
  $listener.Start()
  $prefix = "http://localhost:$Port/"
}

$types = @{
  ".html" = "text/html; charset=utf-8"
  ".json" = "application/json; charset=utf-8"
  ".js"   = "text/javascript; charset=utf-8"
  ".css"  = "text/css; charset=utf-8"
  ".webmanifest" = "application/manifest+json"
  ".svg"  = "image/svg+xml"
  ".png"  = "image/png"
  ".txt"  = "text/plain; charset=utf-8"
  ".md"   = "text/plain; charset=utf-8"
}

Write-Host "  serving $Root on $prefix"

while ($listener.IsListening) {
  $ctx = $listener.GetContext()
  $req = $ctx.Request
  $res = $ctx.Response
  try {
    $rel = [Uri]::UnescapeDataString($req.Url.AbsolutePath).TrimStart("/")
    if ([string]::IsNullOrWhiteSpace($rel)) { $rel = "index.html" }
    $path = [IO.Path]::GetFullPath((Join-Path $Root $rel))

    # never serve outside the folder this script lives in
    if (-not $path.StartsWith($Root, [StringComparison]::OrdinalIgnoreCase)) {
      $res.StatusCode = 403; $res.Close(); continue
    }
    if (Test-Path $path -PathType Container) { $path = Join-Path $path "index.html" }

    if (Test-Path $path -PathType Leaf) {
      $bytes = [IO.File]::ReadAllBytes($path)
      $ext = [IO.Path]::GetExtension($path).ToLower()
      $res.ContentType = if ($types.ContainsKey($ext)) { $types[$ext] } else { "application/octet-stream" }
      $res.Headers.Add("Cache-Control", "no-cache")
      $res.ContentLength64 = $bytes.Length
      $res.OutputStream.Write($bytes, 0, $bytes.Length)
    } else {
      $res.StatusCode = 404
      $msg = [Text.Encoding]::UTF8.GetBytes("not found: " + $rel)
      $res.ContentType = "text/plain; charset=utf-8"
      $res.OutputStream.Write($msg, 0, $msg.Length)
    }
  } catch {
    try { $res.StatusCode = 500 } catch { }
  } finally {
    try { $res.Close() } catch { }
  }
}
