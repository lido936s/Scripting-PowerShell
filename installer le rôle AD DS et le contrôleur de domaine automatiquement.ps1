# installer le rôle AD DS et le contrôleur de domaine automatiquement 
# Installez le rôle AD DS
Install-WindowsFeature -Name "ad-domain-services" -IncludeManagementTools

# Définissez les valeurs des paramètres
$DomainName = "example.com"
$SafeModeAdministratorPassword = ConvertTo-SecureString "Password123" -AsPlainText -Force

# Personnalisez la forêt AD DS
Install-ADDSForest -CreateDnsDelegation:$false -DomainName $DomainName -DomainMode "Win2012R2" -ForestMode "Win2012R2" -InstallDns:$true -NoRebootOnCompletion:$false -SafeModeAdministratorPassword $SafeModeAdministratorPassword

# Attendez que le contrôleur de domaine soit prêt
Start-Sleep -Seconds 300

# Promouvoir le contrôleur de domaine
Install-ADDSDomainController -NoGlobalCatalog:$false -CreateDnsDelegation:$false -DatabasePath "C:\Windows\NTDS" -DomainName $DomainName -InstallDns:$true -LogPath "C:\Windows\NTDS" -NoRebootOnCompletion:$false -SiteName "Default-First-Site-Name" -SYSTEMDRIVE "C:" -ServiceAccountCredential (Get-Credential)