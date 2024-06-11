
# Créer un dossier partagé avec une gestion de droits personnalisés pour un serveur SMB
# Créer un partage de dossier depuis un serveur SMB local et ajouter des utilisateurs ou groupes à ce partage
$smbPath = "\\ServerName\SharedFolder"
$smbName = "SharedFolder"
New-SmbShare -Name "$smbName" -Path "$smbPath"

# Ajouter des utilisateurs et des groupes à ce partage
Add-SmbShareAccess -Name $smbName -AccountName "User1"
Add-SmbShareAccess -Name $smbName -AccountName "Group1"

# Définir le chemin d'accès du dossier à partager
$folderPath = "C:\SharedFolder"

# Définir le nom du partage
$shareName = "SharedFolder"

# Définir les utilisateurs et les groupes avec des droits spécifiques
# accesRights = Read, Write, FullControl 
# identity = User1, Group1 > "User1": "Administrateurs" = FullControl "Group1": "Read" = Read  
$accessEntries = @(
    @{
        Identity = "User1"
        AccessRights = "FullControl" 
    },
    @{
        Identity = "Group1"
        AccessRights = "Read"
    }
)

# Créer le dossier partagé
New-SmbShare -Name $shareName -Path $folderPath -FullAccess "Administrateurs" -ReadAccess $accessEntries.Identity -Force

# Définir les droits d'accès pour chaque utilisateur ou groupe
foreach ($entry in $accessEntries) {
    $identity = $entry.Identity
    $accessRights = $entry.AccessRights
    $acl = New-SmbAccessControlEntry -PrincipalName $identity -AccessRight $accessRights
    Set-SmbShareAccess -Name $shareName -Ace $acl
}