Write-Host "-- Basic dependencies installation --"

apt-get install -y git wl-clipboard p7zip

if (Get-Command 'gh' -ErrorAction SilentlyContinue) {
    Write-Host "skip: gh is already installed."
} else {
    bash ./install/gh.sh
}

if (Get-Command 'code' -ErrorAction SilentlyContinue) {
    Write-Host "skip: vscode is already installed."
} else {
    Invoke-WebRequest -Uri "https://go.microsoft.com/fwlink/?LinkID=760868" -OutFile "/tmp/config-install/vscode.deb"
    apt-get install -y /tmp/config-install/vscode.deb
}
