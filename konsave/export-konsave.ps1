#!/snap/bin/pwsh

if (Test-Path -Path "./main.knsv") {
    Remove-Item -Path "./main.knsv"
}

konsave -s main
konsave -e main -d . 