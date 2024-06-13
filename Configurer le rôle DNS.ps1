
# Créer une nouvelle zone de recherche directe:

Add-DnsServerPrimaryZone -Name "example.com" -ZoneFile "example.com.dns"

# Ajouter un enregistrement A
# Sert à associer un nom de domaine à une adresse IP

Add-DnsServerResourceRecordA -ZoneName "example.com" -Name "www" -IPv4Address "192.168.1.1" -CreatePtr


# Ajouter un enregistrement CNAME
# créer un alias ou un synonyme pour un nom de domaine existant. 
#En d'autres termes, il permet de rediriger un nom de domaine vers un autre nom de domaine.

Add-DnsServerResourceRecordCName -ZoneName "example.com" -Name "www" -HostNameAlias "www.example.com"

# Ajouter un enregistrement MX
# Sert à définir le serveur de messagerie

Add-DnsServerResourceRecordMX -ZoneName "example.com" -Name "www" -MailExchange "mail.example.com" -Preference 10

