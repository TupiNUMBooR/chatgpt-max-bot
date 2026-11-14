# run.ps1
try {
    Write-Host 'up'
    docker compose up --build
}
finally {
    Write-Host 'down'
    docker compose down --remove-orphans
}
