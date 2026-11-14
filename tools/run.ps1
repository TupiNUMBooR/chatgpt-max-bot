# run.ps1
Write-Host 'up'
try {
    docker compose up --build
}
finally {
    Write-Host 'down'
    docker compose down --remove-orphans
}
