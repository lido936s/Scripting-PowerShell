# Niveau de base : cibler le profil utilisateur actuel
# creation d'un lecteur mappé avec le profil utilisateur %username%
# Ce code crée un lecteur mappé avec le nom M: qui pointe vers le répertoire du profil actuel %username%.  
# Le paramètre "-Persist" permet de conserver le lecteur mappé même après la fermeture de la session PowerShell.

$profilePath = [environment]::GetFolderPath('UserProfile')
$mapDrive = "M:"
$targetPath = Join-Path $profilePath $username

New-PSDrive -Name $mapDrive -PSProvider FileSystem -Root $targetPath -Persist

# Niveau avancé :  cibler un utilisateur spécifique dans Active Directory et l'utiliser comme lecteur mappé

$mapDrive = "M:"
$adUser = Get-ADUser -Filter "SamAccountName -eq 'nom_utilisateur'" -Properties ProfilePath
$targetPath = $adUser.ProfilePath

New-PSDrive -Name $mapDrive -PSProvider FileSystem -Root $targetPath -Persist

# Niveau expert : Pour insérer un script PowerShell dans un fichier netuse.bat et l'exécuter

# creation du script
$script = @"
net use M: \\server\share /user:username password
"@

# creation du fichier
$batFile = "netuse.bat"

# ecriture du script
$script | Out-File -FilePath $batFile -Encoding ASCII

# execution du script
Invoke-Expression -Command $batFile

