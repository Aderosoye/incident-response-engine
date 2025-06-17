# Incident Response Engine - Orchestrator Script
Write-Host "=== Incident Response Engine ==="
Write-Host "Running all checks...`n"

# Run all incident modules
& .\modules\Check-Lockout.ps1
& .\modules\Monitor-DiskSpace.ps1
& .\modules\Watch-ServiceCrash.ps1
& .\modules\Monitor-CPU.ps1
& .\modules\Detect-NetworkDrop.ps1

Write-Host "`nIncident response run completed."