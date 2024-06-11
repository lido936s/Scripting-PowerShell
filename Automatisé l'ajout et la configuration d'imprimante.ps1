# automatisé l'ajout et la configuration d'imprimante sur le réseau .

# 1- Sans Récupération des informations de l'imprimante
# Définir les détails de l'imprimante
$printerName = "Nom de l'imprimante"
$printerIP = "Adresse IP de l'imprimante"
$printerShareName = "Nom du partage de l'imprimante"

# Ajouter l'imprimante
Add-Printer -ConnectionName "\\$printerIP\$printerShareName" -Name $printerName

# Configurer l'imprimante
Set-Printer -Name $printerName -PrintProcessor "WinPrint" -DriverName "Microsoft Print to PDF"

# Définir l'imprimante par défaut
Set-Printer -Name $printerName -Default

# Vérifier l'état de l'imprimante
Get-Printer -Name $printerName

# 2- Avec Récupération des informations de l'imprimante
# Ce fait est possible en utilisant les informations de l'imprimante "Get-WmiObject"

# Définir les détails de l'imprimante
$printerName = "Nom de l'imprimante"
$printerIP = "Adresse IP de l'imprimante"
$printerShareName = "Nom du partage de l'imprimante"

# Récupérer les informations de l'imprimante
$printer = Get-WmiObject -Class Win32_Printer -Filter "Name='$printerName'"

# Récupérer le pilote en fonction de la marque de l'imprimante
$printerDriver = $printer.DriverName.Split(",")[0]
$printerDriverName = (Get-WmiObject -Class Win32_PrinterDriver -Filter "Name='$printerDriver'").Name

# Ajouter l'imprimante
Add-Printer -ConnectionName "\\$printerIP\$printerShareName" -Name $printerName -DriverName $printerDriverName

# Configurer l'imprimante
Set-Printer -Name $printerName -PrintProcessor "WinPrint" -DriverName $printerDriverName

# Définir l'imprimante par défaut
Set-Printer -Name $printerName -Default

# Vérifier l'état de l'imprimante
Get-Printer -Name $printerName