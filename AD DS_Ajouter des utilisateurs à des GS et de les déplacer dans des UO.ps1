# Ajouter des utilisateurs à des groupes et les ajouter à l'Active Directory et les deplacer dans des unités organisatrices .
# Importer le module Active Directory
Import-Module ActiveDirectory

# Définir les informations d'identification pour se connecter à l'Active Directory
$credential = Get-Credential

# Définir les noms des utilisateurs, des groupes et des unités organisatrices
$users = @("user1", "user2", "user3")
$groups = @("group1", "group2", "group3")
$organizationalUnits = @("ou1", "ou2", "ou3")

# Parcourir les utilisateurs
foreach ($user in $users) {
    # Créer un nouvel objet utilisateur
    $newUser = New-ADUser -Name $user -SamAccountName $user -UserPrincipalName "$user@example.com" -AccountPassword (ConvertTo-SecureString "Password123" -AsPlainText -Force) -Enabled $true

    # Parcourir les groupes
    foreach ($group in $groups) {
        # Ajouter l'utilisateur au groupe
        Add-ADGroupMember -Identity $group -Members $newUser
    }

    # Parcourir les unités organisatrices
    foreach ($ou in $organizationalUnits) {
        # Déplacer l'utilisateur dans l'unité organisationnelle
        Move-ADObject -Identity $newUser -TargetPath "OU=$ou,DC=example,DC=com"
    }
}