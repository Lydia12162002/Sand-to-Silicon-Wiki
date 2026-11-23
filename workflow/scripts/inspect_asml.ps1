$content = Get-Content 'raw/SRC-005_asml_light_and_lasers.html' -Raw -Encoding utf8
$clean = $content -replace '<style[^>]*>.*?</style>', '' -replace '<script[^>]*>.*?</script>', '' -replace '<[^>]+>', ' '
$clean = [System.Net.WebUtility]::HtmlDecode($clean) -replace '\s+', ' '

Write-Output "=== Length of clean text: $($clean.Length) ==="

$keywords = @("13.5", "193", "248", "365", "wavelength", "DUV", "EUV", "laser", "tin", "droplet", "plasma", "excimer", "mercury", "argon fluoride")

foreach ($kw in $keywords) {
    Write-Output "--- Mentions of '$kw' ---"
    $matches = [regex]::Matches($clean, "(?i)(?:[^.!?]{0,100})$kw(?:[^.!?]{0,100}[.!?])")
    $count = 0
    foreach ($m in $matches) {
        Write-Output "  * $($m.Value.Trim())"
        $count++
        if ($count -ge 3) { break }
    }
}
