# Run on the OLD laptop from the repo root:
#   powershell -ExecutionPolicy Bypass -File scripts\backup-config.ps1
$ErrorActionPreference = "Stop"
$src  = Join-Path $env:APPDATA "Claude\claude_desktop_config.json"
$dest = Join-Path $PSScriptRoot "..\config\claude_desktop_config.json"

if (-not (Test-Path $src)) { Write-Error "Not found: $src" }
Copy-Item $src $dest -Force
Write-Host "Copied to $dest"

# Warn about anything that looks like a secret
$hits = Select-String -Path $dest -Pattern '(?i)(key|token|secret|password)"\s*:\s*"[^"<]'
if ($hits) {
  Write-Warning "Possible secrets found - replace them with <SET-ME> before committing:"
  $hits | ForEach-Object { Write-Host "  line $($_.LineNumber): $($_.Line.Trim())" }
}

# Also list mod / extension folders so they can be recorded
Write-Host "`nFolders in $env:APPDATA\Claude (check for mods/extensions):"
Get-ChildItem (Join-Path $env:APPDATA "Claude") -Directory | ForEach-Object { Write-Host "  $($_.Name)" }
