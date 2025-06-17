# Module: Monitor-CPU.ps1
# Description: Checks CPU usage and kills high-usage processes

$cpu = Get-Counter '\Processor(_Total)\% Processor Time' | Select-Object -ExpandProperty CounterSamples | Select-Object -ExpandProperty CookedValue
if ($cpu -gt 90) {
    Get-Process | Where-Object { $_.CPU -gt 100 } | Stop-Process -Force
    Add-Content -Path ../logs/cpu-log.txt -Value "$(Get-Date) - High CPU detected. Processes killed."
    Write-Host "High CPU usage detected. Actions taken."
}
