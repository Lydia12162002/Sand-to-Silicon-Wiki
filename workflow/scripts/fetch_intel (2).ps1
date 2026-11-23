[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$headers = @{
    "User-Agent" = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36"
    "Accept" = "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,*/*;q=0.8"
    "Accept-Language" = "en-US,en;q=0.9"
    "Sec-Ch-Ua" = '"Chromium";v="124", "Google Chrome";v="124"'
    "Sec-Ch-Ua-Mobile" = "?0"
    "Sec-Ch-Ua-Platform" = '"Windows"'
    "Sec-Fetch-Dest" = "document"
    "Sec-Fetch-Mode" = "navigate"
    "Sec-Fetch-Site" = "none"
    "Sec-Fetch-User" = "?1"
    "Upgrade-Insecure-Requests" = "1"
}

$url = "https://www.intel.com/content/www/us/en/newsroom/tech101/manufacturing/how-silicon-die-become-chip-packages.html"
$outFile = "raw/SRC-006_intel_how_silicon_die_become_chip_packages.html"

try {
    Write-Output "Fetching $url ..."
    $response = Invoke-WebRequest -Uri $url -Headers $headers -UseBasicParsing -TimeoutSec 30
    [System.IO.File]::WriteAllBytes($outFile, $response.RawContentStream.ToArray())
    $len = (Get-Item $outFile).Length
    Write-Output "Successfully fetched. File size: $len bytes"
} catch {
    Write-Error "Failed to fetch: $_"
}
