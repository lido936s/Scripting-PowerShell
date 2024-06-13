# creer une machine virtuelle sur virtualbox avec powershell

# Importer le module VirtualBox
Import-Module VirtualBox

# Creer une machine virtuelle

$MountIso = "NomDeL'ISO"
$VboxName = "NomDeLaMachineVirtuelle"

New-VBoxVM -Name "$VboxName" -OSType "$MountIso" -MemorySize 2048 -Register

Set-VBoxProperty -Name "NomDeLaMachineVirtuelle" -OSType "$MountIso" -MemorySize 2048 -Register

Start-VBoxVM -Name "$VboxName"

# verifier le statut de la machine virtuelle

Get-VBoxVM -Name "$VboxName"

# Si vous souhaitez supprimer la machine virtuelle.
# Decommenter la ligne #Remove-VBoxVM -Name "$VboxName"
# Supprimer la machine virtuelle

#Remove-VBoxVM -Name "$VboxName"

# Deconnecter de virtualbox

#Disconnect-VBox
