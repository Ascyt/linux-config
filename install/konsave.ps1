Write-Host "-- KDE plasma config --"

Write-Host "Installing Python packages..."
pipx ensurepath
pipx install konsave
pipx inject konsave setuptools
pipx upgrade konsave --pip-args='setuptools<81' # Deprecation workaround (pkg_resources is removed 2025-11-30)
