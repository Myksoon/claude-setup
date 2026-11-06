# Run on the NEW laptop from the repo root, with Claude Desktop closed:
#   powershell -ExecutionPolicy Bypass -File scripts\restore-config.ps1
$ErrorActionPreference = "Stop"
$src     = Join-Path $PSScriptRoot "..\config\claude_desktop_config.json"
$destDir = Join-Path $env:APPDATA "Claude"
$dest    = Join-Path $destDir "claude_desktop_config.json"

if (-not (Test-Path $src)) { Write-Error "Run backup-config.ps1 on the old laptop first ($src missing)." }
if (Select-String -Path $src -Pattern '<SET-ME>' -Quiet) {
  Write-Warning "Config still has <SET-ME> placeholders - fill them in, then rerun."; exit 1
}
New-Item -ItemType Directory -Force $destDir | Out-Null
if (Test-Path $dest) {
  $bak = "$dest.bak-$(Get-Date -Format yyyyMMdd-HHmmss)"
  Copy-Item $dest $bak; Write-Host "Existing config backed up to $bak"
}
Copy-Item $src $dest -Force
Write-Host "Installed $dest - restart Claude Desktop."
