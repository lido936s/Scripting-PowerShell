# Remplacer une adresse IP statique par une autre
# Définissez l'adresse IP à remplacer et la nouvelle adresse IP
$OldIPAddress = "127.0.0.1"
$NewIPAddress = "192.168.0.100"

# Récupérez l'adresse IP à modifier
$IPAddress = (Get-NetIPAddress -AddressFamily IPv4 -Address $OldIPAddress).InterfaceAlias

# Modifiez l'adresse IP
Set-NetIPAddress -InterfaceAlias $IPAddress -IPAddress $NewIPAddress