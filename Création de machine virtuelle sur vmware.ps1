# creer une machine virtuelle sur vmware avec powershell

# Importer le module PowerCLI
Import-Module VMware.VimAutomation.Core

# Connexion à l'hôte vSphere
Connect-VIServer -Server your_vcenter_server -User your_username -Password your_password

# Créer une nouvelle machine virtuelle
New-VM -Name your_vm_name -VMHost your_esxi_host -Datastore your_datastore -Template your_template_vm

# Configurez les paramètres de la machine virtuelle
Set-VM -VM your_vm_name -NumCPU 2 -MemoryMB 2048 -NetworkName your_network

# Démarrez la machine virtuelle
Start-VM -VM your_vm_name

# Déconnectez-vous de l'hôte vSphere
Disconnect-VIServer -Confirm:$false