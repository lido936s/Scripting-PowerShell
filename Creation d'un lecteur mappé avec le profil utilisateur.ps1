# creation d'un lecteur mappé avec le profil utilisateur %username%
# Ce code crée un lecteur mappé avec le nom M: qui pointe vers le répertoire du profil actuel %username%.  
# Le paramètre "-Persist" permet de conserver le lecteur mappé même après la fermeture de la session PowerShell.

$profilePath = [environment]::GetFolderPath('UserProfile')
$mapDrive = "M:"
$targetPath = Join-Path $profilePath $username

New-PSDrive -Name $mapDrive -PSProvider FileSystem -Root $targetPath -Persist