if (Get-Command 'discord' -ErrorAction SilentlyContinue) {
    Write-Host "skip: discord is already installed."
    exit 0
}

Write-Host "-- Discord installation --"

Invoke-WebRequest -Uri "https://discord.com/api/download?platform=linux" -OutFile "/tmp/config-install/discord.deb"

Write-Host "Installing Discord..."

sudo apt install -y /tmp/config-install/discord.deb

Write-Host "Discord installation completed."
