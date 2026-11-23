$content = Get-Content 'raw/SRC-006_intel_how_silicon_die_become_chip_packages.html' -Raw -Encoding utf8
$clean = $content -replace '<style[^>]*>.*?</style>', '' -replace '<script[^>]*>.*?</script>', '' -replace '<[^>]+>', "`n"
$clean = [System.Net.WebUtility]::HtmlDecode($clean)
$lines = $clean -split "`n" | ForEach-Object { $_.Trim() } | Where-Object { $_.Length -gt 25 }
$lines | ForEach-Object { Write-Output ">> $_" }
