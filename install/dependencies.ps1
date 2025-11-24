Write-Host "-- Basic dependencies installation --"

apt-get install -y git wl-clipboard p7zip python3-full python3-pip pipx docker-compose-plugin

if (!(Select-String -Path $PROFILE -Pattern '\$env:PATH \+= ":\$HOME/.local/bin"')) {
    Add-Content $PROFILE '$env:PATH += ":$HOME/.local/bin"'
    . $PROFILE 
}

if (Get-Command 'gh' -ErrorAction SilentlyContinue) {
    Write-Host "skip: gh is already installed."
} else {
    bash ./install/dependencies/gh.sh
}

if (Get-Command 'code' -ErrorAction SilentlyContinue) {
    Write-Host "skip: vscode is already installed."
} else {
    Invoke-WebRequest -Uri "https://go.microsoft.com/fwlink/?LinkID=760868" -OutFile "/tmp/config-install/vscode.deb"
    apt-get install -y /tmp/config-install/vscode.deb
}

if (Get-Command 'docker' -ErrorAction SilentlyContinue) {
    Write-Host "skip: docker is already installed."
} else {
    bash ./install/dependencies/docker.sh
}
