#!/snap/bin/pwsh
if ((whoami) -ne 'root') {
    Write-Host "This script must be run with sudo."
    exit 1
}

New-Item -ItemType Directory -Path "/tmp/config-install"

sudo pwsh ./install/dependencies.ps1
sudo pwsh ./install/xremap.ps1

Write-Host "Cleaning up..."

Remove-Item -Path "/tmp/config-install/" -Recurse

Write-Host "Done."
