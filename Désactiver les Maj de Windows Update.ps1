# Pour désactiver automatiquement les mises à jour Windows avec PowerShell, vous pouvez utiliser la commande New-ItemProperty pour modifier une clé de Registre. 
New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update" -Name "NoAutoUpdate" -Value 1 -PropertyType DWord -Force
# réactiver les mises à jour Windows automatiques
Remove-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update" -Name "NoAutoUpdate" -Force
