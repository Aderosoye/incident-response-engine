# Module: Watch-ServiceCrash.ps1
# Description: Monitors and restarts crashed critical services

$service = Get-Service -Name 'Spooler'
if ($service.Status -ne 'Running') {
    Start-Service -Name 'Spooler'
    Add-Content -Path ../logs/service-log.txt -Value "$(Get-Date) - Spooler service restarted."
    Write-Host "Spooler service was down. Restarted."
}
