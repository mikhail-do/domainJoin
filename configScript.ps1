# Loading and parsing a JSON file
$config = Get-Content -Path "$PSScriptRoot\config.json" | ConvertFrom-Json

# Reading variables
$domainName = $config.DOMAIN_NAME
$userName = $config.USER_NAME
$userPassword = $config.USER_PASSWORD
$dnsServerAddresses = $config.DNS_ADDRESSES

# Get the name of the network adapter starting with "Ethernet"
$netAdapterName = (Get-NetAdapter | Where-Object { $_.Name -like "Ethernet*" } | Select-Object -First 1).Name 

# Setting up DNS server address
Set-DnsClientServerAddress -InterfaceAlias $netAdapterName -ServerAddresses $dnsServerAddresses

# Converting password to secure string
$securePassword = ConvertTo-SecureString $userPassword -AsPlainText -Force

# Creating a credential object
$credential = New-Object System.Management.Automation.PSCredential($userName, $securePassword)

# Requesting new computer name (Must be entered in PC-*Inverter number* format)
Write-Host ""
$newComputerName = Read-Host -Prompt "Enter the computer name in the format PC-*Inventory num*"

# Changing computer name without immediate reboot
Rename-Computer -NewName $newComputerName -Force

# Adding computer to domain
Add-Computer -DomainName $domainName -Credential $Credential -NewName $newComputerName

# Checking parameters
Write-Host ""
Write-Host "Computer name: $newComputerName"
Write-Host -NoNewline "Computer domain membership: "
Write-Host (Get-WmiObject Win32_ComputerSystem).Domain
Write-Host "`n- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - "
Write-Host "DNS settings:"
Get-DnsClientServerAddress -InterfaceAlias $netAdapterName
Write-Host "`n- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - "

# Performing reboot (after checking)
Write-Host ""
Read-Host -Prompt "Press *Enter* to restart the computer."
Restart-Computer