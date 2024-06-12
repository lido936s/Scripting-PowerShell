# Pour paramétrer un DNS avec un CNAME > Add-DnsServerResourceRecordCname
# Importez le module DnsServer
Import-Module DnsServer

# Définissez les valeurs des paramètres
$DnsServer = "nom_serveur_dns"
$ZoneName = "nom_zone_dns"
$CnameName = "nom_cname"
$CanonicalName = "nom_cible"

# Créez l'enregistrement CNAME
Add-DnsServerResourceRecordCname -ComputerName $DnsServer -ZoneName $ZoneName -Name $CnameName -HostNameAlias $CanonicalName