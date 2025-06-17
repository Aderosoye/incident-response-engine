# Module: Monitor-DiskSpace.ps1
# Description: Monitors and cleans when disk space is critical

$free = (Get-PSDrive C).Free / 1GB
if ($free -lt 10) {
    Write-Host "Low disk space detected. Running cleanup..."
    Remove-Item -Path "C:\Windows\Temp\*" -Recurse -Force -ErrorAction SilentlyContinue
    Add-Content -Path ../logs/disk-log.txt -Value "$(Get-Date) - Low disk space. Cleanup triggered."
}
