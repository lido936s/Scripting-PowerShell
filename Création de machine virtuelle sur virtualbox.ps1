# creer une machine virtuelle sur virtualbox avec powershell

$Iso = 

Install-Module -Name VirtualBox

New-VBoxVM -Name "NomDeLaMachineVirtuelle" -OSType "NomDeL'ISO" -MemorySize 2048 -Register

Set-VBoxProperty -Name "NomDeLaMachineVirtuelle" -OSType "NomDeL'ISO" -MemorySize 2048 -Register

Start-VBoxVM -Name "NomDeLaMachineVirtuelle"

