#!/snap/bin/pwsh

Write-Host "Importing Konsave profile from main.knsv..."

konsave -i main.knsv
konsave -a main

Write-Host "Konsave profile 'main' imported."