# install.ps1 - apply this repo as the source of truth for the opencode harness
param([switch]$DryRun)

$ErrorActionPreference = 'Stop'
$repo  = Split-Path -Parent $MyInvocation.MyCommand.Path
$cfg   = Join-Path $env:USERPROFILE '.config\opencode'
$stamp = Get-Date -Format 'yyyyMMdd-HHmmss'

function Act([string]$what, [scriptblock]$do) {
  if ($DryRun) { "DRY: $what" } else { & $do; "OK : $what" }
}

# 1. config files (copied so edits land in the live harness; edit the repo and re-run)
foreach ($f in @('AGENTS.md', 'opencode.json', 'opencode.jsonc', 'package.json', 'package-lock.json')) {
  $src = Join-Path $repo "opencode\$f"
  if (-not (Test-Path $src)) { continue }
  Act "copy $f -> $cfg\$f" { Copy-Item $src (Join-Path $cfg $f) -Force }
}

# 2. skills roots become junctions into this repo (single source of truth)
$links = @(
  @{ path = (Join-Path $cfg 'skills');                       target = (Join-Path $repo 'opencode\skills') },
  @{ path = (Join-Path $env:USERPROFILE '.agents\skills');   target = (Join-Path $repo 'agents\skills') }
)

foreach ($l in $links) {
  $p = $l.path; $t = $l.target
  if (Test-Path $p) {
    $item = Get-Item $p -Force
    if ($item.Attributes -match 'ReparsePoint') {
      $cur = @($item.Target) -join ';'
      if ($cur -eq $t) { "OK : already linked $p"; continue }
      Act "remove stale link $p" { cmd /c rmdir "$p" | Out-Null }
    } else {
      Act "backup existing $p -> $p.backup-$stamp" { Rename-Item $p "$p.backup-$stamp" }
    }
  }
  Act "junction $p -> $t" { New-Item -ItemType Junction -Path $p -Target $t | Out-Null }
}

if ($DryRun) { "done (dry run - nothing changed)" } else { "done" }
