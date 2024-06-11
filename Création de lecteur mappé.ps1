# Spécifiez le chemin du dossier source
$sourcePath = "C:\chemin\vers\le\dossier"

# Spécifiez le nom du lecteur mappé (une lettre)
$driveLetter = "X"

# Vérifiez si le lecteur mappé existe déjà
if (Test-Path -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\DosDevices\" -PathType Container -ErrorAction SilentlyContinue) {
    $driveInfo = Get-WmiObject -Class Win32_MappedLogicalDisk -Filter "DriveLetter='$driveLetter'"
    if ($driveInfo) {
        Write-Host "Le lecteur mappé $driveLetter existe déjà."
        return
    }
}

# Créez le lecteur mappé
New-PSDrive -Name $driveLetter -PSProvider FileSystem -Root $sourcePath -Persist -Credential (Get-Credential -Message "Entrez vos informations d'identification pour accéder au dossier source")