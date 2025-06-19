# Doel - Gender bepalen op basis van de naam
# https://api.genderize.io/?name=Sil
$naam = Read-Host -Prompt "Wat is je naam?"
$data = Invoke-WebRequest -Uri "https://api.genderize.io/?name=Sil"
$json = $data.Content | ConvertFrom-Json
Write-Host $json.name
Write-Host $json.gender