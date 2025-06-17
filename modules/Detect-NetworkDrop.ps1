# Module: Detect-NetworkDrop.ps1
# Description: Monitors for network drops

$ping = Test-Connection -ComputerName 8.8.8.8 -Count 2 -Quiet
if (-not $ping) {
    Add-Content -Path ../logs/network-log.txt -Value "$(Get-Date) - Network unreachable."
    Write-Host "Network connectivity issue detected."
}
