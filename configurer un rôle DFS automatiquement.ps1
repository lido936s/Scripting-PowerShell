# configurer un rôle DFS automatiquement
# Définissez les valeurs des paramètres
$NamespacePath = "\\contoso.com\dfsroot"
$TargetPath = "\\server1\share1"

# Créez la racine DFS
New-DfsnRoot -Path $NamespacePath -TargetPath $TargetPath

# Créez un dossier DFS
New-DfsnFolder -Path $NamespacePath -TargetPath $TargetPath -FolderName "MyFolder"

# Assurez-vous de remplacer "contoso.com" par le nom de votre domaine et "server1" par le nom de votre serveur cible. 
# Vous pouvez également personnaliser le chemin du dossier DFS en modifiant la valeur de $TargetPath et le nom du dossier en modifiant la valeur de $FolderName.
# Ce code crée une racine DFS à l'emplacement spécifié et crée ensuite un dossier DFS sous la racine. 
#Vous pouvez ajouter d'autres dossiers DFS en utilisant la cmdlet New-DfsnFolder en spécifiant le chemin de la racine DFS et le chemin du dossier parent.
# N'oubliez pas d'exécuter PowerShell en tant qu'administrateur pour pouvoir effectuer ces modifications sur le système de fichiers distribué.