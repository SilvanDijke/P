# Zorg dat de MessageBox beschikbaar is
Add-Type -AssemblyName System.Windows.Forms

try {
    # Klantenlijst ophalen
    $url = "https://api.sunnus.nl/customers"
    $data = Invoke-WebRequest -Uri $url
    $customers = $data.Content | ConvertFrom-Json

    foreach ($customer in $customers) {
        Write-Host "$($customer.id) $($customer.company_name)"
    }

    $customerid = Read-Host "Welke klant wil je selecteren"

    # Serverlijst voor geselecteerde klant ophalen
    $url = "https://api.sunnus.nl/customers/$customerid/servers"
    $data = Invoke-WebRequest -Uri $url
    $servers = $data.Content | ConvertFrom-Json

    foreach ($server in $servers) {
        Write-Host "$($server.id) $($server.name)"
    }
}
catch {
    # Foutmelding in console
    Write-Host "Fout gevonden!" -ForegroundColor Red
    [console]::Beep(500,500)

    # Pop-upmelding
    [System.Windows.Forms.MessageBox]::Show("Fout: Klant-ID niet gevonden of API is niet bereikbaar.","Foutmelding","OK","Error")

    exit
}
