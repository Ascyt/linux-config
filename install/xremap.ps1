if (Test-Path -Path "./xremap/xremap") {
    Write-Host "skip: xremap is already installed."
    exit 0
}

Write-Host "-- xremap installation --"

Write-Host "Downloading xremap..."
Invoke-WebRequest -Uri "https://github.com/xremap/xremap/releases/download/v0.14.3/xremap-linux-x86_64-kde.zip" -OutFile "/tmp/config-install/xremap.zip"

Write-Host "Extracting xremap..."
7z x /tmp/config-install/xremap.zip -o/tmp/config-install/xremap
Move-Item -Path "/tmp/config-install/xremap/xremap" -Destination "./xremap/xremap"

Write-Host "Writing files..."
@"
[Unit]
Description=Run xremap keyboard config at startup

[Service]
Type=simple 
User=filip
WorkingDirectory=/home/filip/config/xremap
ExecStart=/usr/bin/sudo /home/filip/config/xremap/xremap /home/filip/config/xremap/config.yml --mouse

[Install]
WantedBy=multi-user.target
"@ | Set-Content -Path '/etc/systemd/system/xremap-startup.service'

@"
filip ALL=(ALL) NOPASSWD: /home/filip/config/xremap/xremap /home/filip/config/xremap/config.yml --mouse
"@ | Set-Content -Path '/etc/sudoers.d/filip'

chmod 0440 /etc/sudoers.d/filip

Write-Host "Enabling xremap service..."
systemctl enable xremap-startup.service
