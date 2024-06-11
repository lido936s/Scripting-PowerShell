# Créer et ajouter un profil utilisateur itinérant à un groupe et le deplacer dans une unité organisationnelle
# Importer le module Active Directory
Import-Module ActiveDirectory

# Définir les informations d'identification pour se connecter à l'Active Directory
$credential = Get-Credential

# Définir le nom du profil utilisateur itinérant
$profileName = "ProfileName"

# Créer un nouvel objet de profil utilisateur itinérant
$newProfile = New-ADUser -Name $profileName -SamAccountName $profileName -UserPrincipalName "$profileName@example.com" -AccountPassword (ConvertTo-SecureString "Password123" -AsPlainText -Force) -Enabled $true -OtherAttributes @{msDS-UserAccountDisabled="TRUE";msDS-UserDontExpirePassword="TRUE"}

# Ajouter le profil utilisateur itinérant à un groupe
Add-ADGroupMember -Identity "GroupName" -Members $newProfile

# Déplacer le profil utilisateur itinérant dans une unité organisationnelle
Move-ADObject -Identity $newProfile -TargetPath "OU=OrganizationalUnit,DC=example,DC=com"