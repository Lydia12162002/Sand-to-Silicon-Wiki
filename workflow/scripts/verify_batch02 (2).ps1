# ==============================================================================
# Script: verify_batch02.ps1
# Purpose: Reproducible verification script for Stage 2 Batch 02 (C11, C21, C31)
# ==============================================================================

$ErrorActionPreference = "Stop"

Write-Output "=========================================================="
Write-Output "   Stage 2 - Batch 02 Automated Quality Verification"
Write-Output "==========================================================`n"

# ------------------------------------------------------------------------------
# 1. C11: Manifest & Hash Verification (SRC-001 through SRC-004)
# ------------------------------------------------------------------------------
Write-Output ">>> [1/3] C11: CHECK_BATCH_INGEST (Source & Manifest Check)..."
$manifestPath = "sources/manifest.json"
if (-not (Test-Path $manifestPath)) {
    Write-Error "FAIL: $manifestPath does not exist!"
}
$manifest = Get-Content $manifestPath -Raw -Encoding utf8 | ConvertFrom-Json

$c11_passed = $true
foreach ($src in $manifest.sources) {
    if (-not (Test-Path $src.filepath)) {
        Write-Output "  [FAIL] Missing raw file: $($src.filepath)"
        $c11_passed = $false
        continue
    }
    $actualHash = (Get-FileHash -Path $src.filepath -Algorithm SHA256).Hash.ToLower()
    $expectedHash = $src.checksum.ToLower()
    if ($actualHash -eq $expectedHash) {
        Write-Output "  [PASS] $($src.id) ($($src.author_organization)): SHA256 matched ($actualHash)"
    } else {
        Write-Output "  [FAIL] $($src.id): Hash mismatch! Expected: $expectedHash, Actual: $actualHash"
        $c11_passed = $false
    }
}

if ($c11_passed) {
    Write-Output ">>> Result C11: PASS`n"
} else {
    Write-Output ">>> Result C11: FAIL`n"
}

# ------------------------------------------------------------------------------
# 2. C21: Markdown Frontmatter & Source Tracking Check
# ------------------------------------------------------------------------------
Write-Output ">>> [2/3] C21: CHECK_COMPILATION (Frontmatter & Source Tracking)..."
$mdFiles = Get-ChildItem -Path "wiki" -Recurse -Filter "*.md"
$validSourceIds = $manifest.sources.id
$c21_passed = $true

foreach ($file in $mdFiles) {
    if ($file.Name -eq "log.md") { continue }
    $content = Get-Content -Path $file.FullName -Raw -Encoding utf8
    if ($content -notmatch '(?s)^---\r?\n(.*?)\r?\n---') {
        Write-Output "  [FAIL] Missing YAML Frontmatter: $($file.Name)"
        $c21_passed = $false
        continue
    }
    $fm = $matches[1]
    $fields = @("title", "english_title", "category", "last_updated")
    foreach ($f in $fields) {
        if ($fm -notmatch "${f}:") {
            Write-Output "  [FAIL] Missing field '${f}' in: $($file.Name)"
            $c21_passed = $false
        }
    }
    if ($fm -match 'sources:\s*\r?\n((?:\s*-\s*"[^"]+"\r?\n?)+)') {
        $srcMatches = [regex]::Matches($matches[1], '-\s*"([^"]+)"')
        foreach ($sm in $srcMatches) {
            $sid = $sm.Groups[1].Value
            if ($sid -notin $validSourceIds) {
                Write-Output "  [FAIL] Invalid Source ID '$sid' in: $($file.Name)"
                $c21_passed = $false
            }
        }
    }
}

if ($c21_passed) {
    Write-Output "  [PASS] All $($mdFiles.Count - 1) wiki content pages have valid YAML frontmatter and authentic source IDs."
    Write-Output ">>> Result C21 (Structure & Frontmatter): PASS`n"
} else {
    Write-Output ">>> Result C21: FAIL`n"
}

# ------------------------------------------------------------------------------
# 3. C31: Markdown Relative Links & Orphan Page Check
# ------------------------------------------------------------------------------
Write-Output ">>> [3/3] C31: CHECK_LINT (Broken Links & Orphan Pages)..."
$linkErrors = @()
$referencedPages = [System.Collections.Generic.HashSet[string]]::new()
$totalLinks = 0

foreach ($file in $mdFiles) {
    $content = Get-Content -Path $file.FullName -Raw -Encoding utf8
    $links = [regex]::Matches($content, '\[([^\]]+)\]\(([^)]+)\)')
    foreach ($link in $links) {
        $target = $link.Groups[2].Value.Split('#')[0]
        if ($target -match '^https?://' -or $target -match '^file://' -or $target -eq '') { continue }
        $totalLinks++
        $resolved = [System.IO.Path]::GetFullPath([System.IO.Path]::Combine($file.DirectoryName, $target))
        if (-not (Test-Path $resolved)) {
            $linkErrors += "Broken link in $($file.Name): '$target' -> '$resolved'"
        } else {
            if ($resolved.EndsWith(".md")) {
                [void]$referencedPages.Add($resolved.ToLower())
            }
        }
    }
}

$c31_passed = $true
if ($linkErrors.Count -gt 0) {
    Write-Output "  [FAIL] Broken links detected:"
    $linkErrors | ForEach-Object { Write-Output "    - $_" }
    $c31_passed = $false
} else {
    Write-Output "  [PASS] 0 Broken links found across $totalLinks relative links."
}

# Orphan pages
$orphanPages = @()
foreach ($file in $mdFiles) {
    if ($file.Name -in @("index.md", "log.md")) { continue }
    if (-not $referencedPages.Contains($file.FullName.ToLower())) {
        $orphanPages += $file.Name
    }
}

if ($orphanPages.Count -gt 0) {
    Write-Output "  [FAIL] Orphan pages detected:"
    $orphanPages | ForEach-Object { Write-Output "    - $_" }
    $c31_passed = $false
} else {
    Write-Output "  [PASS] 0 Orphan pages found. Every page is reachable from wiki/index.md or interlinked."
}

if ($c31_passed) {
    Write-Output ">>> Result C31: PASS`n"
} else {
    Write-Output ">>> Result C31: FAIL`n"
}

Write-Output "=========================================================="
Write-Output "   Summary: C11: $(if ($c11_passed) {'PASS'} else {'FAIL'}) | C21(Schema): $(if ($c21_passed) {'PASS'} else {'FAIL'}) | C31: $(if ($c31_passed) {'PASS'} else {'FAIL'})"
Write-Output "=========================================================="
