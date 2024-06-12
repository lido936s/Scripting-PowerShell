# Pour créer un VLAN sur une carte réseau VMware PowerCLI

# Importer le module PowerCLI
Import-Module VMware.VimAutomation.Core

# Connexion à l'hôte vCenter
Connect-VIServer -Server <nom_de_l_hote_vcenter> -User <nom_utilisateur> -Password <mot_de_passe>

# Obtenir la carte réseau
$networkAdapter = Get-NetworkAdapter -Name <nom_de_la_carte_reseau>

# Créer un VLAN
$vlan = New-Vlan -Name <nom_du_vlan> -VlanId <id_du_vlan> -Access -NetworkAdapter $networkAdapter

# Appliquer le VLAN à la carte réseau
$networkAdapter | Set-NetworkAdapter -VlanId $vlan.VlanId

# Désactiver la carte réseau
$networkAdapter | Disable-NetworkAdapter

# Activer la carte réseau
$networkAdapter | Enable-NetworkAdapter

# Désinstaller le module PowerCLI
Remove-Module VMware.VimAutomation.Core