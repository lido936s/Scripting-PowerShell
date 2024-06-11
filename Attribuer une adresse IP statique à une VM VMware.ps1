# Pour attribuer une adresse IP statique à une machine virtuelle à l'aide de PowerShell, vous pouvez utiliser le module PowerShell VMware PowerCLI. 
# Voici une procédure générale pour attribuer une adresse IP statique à une machine virtuelle :

# Assurez-vous d'avoir installé le module PowerShell VMware PowerCLI sur votre ordinateur. 
# Vous pouvez le télécharger à partir du site officiel de VMware.

# 1 - Ouvrez une session PowerShell et importez le module PowerCLI en utilisant la commande suivante :

Import-Module VMware.PowerCLI

# 2 - Connectez-vous à l'hôte vSphere. 
# Assurez-vous d'avoir configuré votre connexion au serveur vSphere.

Connect-VIServer -Server vCenterServer -User username -Password password

# Remplacez vCenterServer par le nom ou l'adresse IP de votre serveur vCenter, username par votre nom d'utilisateur et password par votre mot de passe.

# 3 - Accédez à la machine virtuelle pour laquelle vous souhaitez attribuer une adresse IP statique. Vous pouvez utiliser la commande suivante pour rechercher la machine virtuelle par son nom :

Get-VM -Name "NomMachineVirtuelle"

# Remplacez "NomMachineVirtuelle" par le nom de la machine virtuelle que vous souhaitez modifier.

# 4 - Configurez l'adresse IP statique de la machine virtuelle en utilisant la commande suivante :
# version sans déclaration de variable pour les paramètres

Get-VM -Name "NomMachineVirtuelle" | Get-NetworkAdapter | Set-NetworkAdapter -IPAddress "AdresseIP" -SubnetMask "MasqueSousReseau" -DefaultGateway "PasserelleParDefaut" -DNSAddress "AdresseDNS"

# version avec déclaration de variable pour les paramètres
$vm = Get-VM -Name "NomMachineVirtuelle"
$ip = "AdresseIP"
$mask = "MasqueSousReseau"
$gateway = "PasserelleParDefaut"
$dns = "AdresseDNS"

$vm | Get-NetworkAdapter | Set-NetworkAdapter -IPAddress $ip -SubnetMask $mask -DefaultGateway $gateway -DNSAddress $dns

Get-VM -Name "NomMachineVirtuelle" | Get-NetworkAdapter | Set-NetworkAdapter -IPAddress "AdresseIP" -SubnetMask "MasqueSousReseau" -DefaultGateway "PasserelleParDefaut" -DNSAddress "AdresseDNS"

# Remplacez "AdresseIP", "MasqueSousReseau", "PasserelleParDefaut" et "AdresseDNS" par les valeurs appropriées pour chaque paramètre.

# 5 - Pour configurer un NAT pour une machine virtuelle, vous pouvez utiliser la commande suivante :

# Importer le module VMware PowerCLI
Import-Module VMware.VimAutomation.Core

# Renseigner les informations de connexion à vCenter Server
$vCenterServer = "vcenter.example.com"
$vCenterUser = "administrator@vsphere.local"
$vCenterPassword = "password"

# Connecter à vCenter Server
Connect-VIServer -Server $vCenterServer -User $vCenterUser -Password $vCenterPassword

# Renseigner les informations de la machine virtuelle
$vmName = "NomDeLaMachineVirtuelle"
$vmNIC = "NomDeLInterfaceDeReseau"

# Obtenir la machine virtuelle
$vm = Get-VM -Name $vmName

# Obtenir l'interface réseau de la machine virtuelle
$nic = Get-NetworkAdapter -VM $vm | Where-Object { $_.Name -eq $vmNIC }

# Configurer le NAT sur l'interface réseau
Set-NetworkAdapter -NetworkAdapter $nic -Type NatNetwork

# Démarrer la machine virtuelle
Start-VM -VM $vm

# Déconnecter de vCenter Server
Disconnect-VIServer * -Confirm:$false

# Assurez-vous d'avoir installé le module VMware PowerCLI et de remplacer les valeurs des variables $vCenterServer, $vCenterUser, $vCenterPassword, $vmName et $vmNIC par les informations correspondantes de votre environnement.

# N'oubliez pas de démarrer la machine virtuelle après avoir configuré le NAT pour que les modifications prennent effet.


