#!/bin/bash
sudo apt update
sudo apt install apache2

systemctl restart apache2.service
sudo chown $USER:$USER /var/www/html/
myip=$(curl --silent -H 'Metadata-Flavor: Google' metadata/computeMetadata/v1/instance/network-interfaces/0/ip)
echo "This is my IP address: $myip"
myMAC=$(curl --silent -H 'Metadata-Flavor: Google' metadata/computeMetadata/v1/instance/network-interfaces/0/mac)
echo "This is my MAC address: $myMAC"
myExtIP=$(curl --silent -H 'Metadata-Flavor: Google' metadata/computeMetadata/v1/instance/network-interfaces/0/access-configs/0/external-ip)
echo "This is my external IP: $myExtIP"
myDNS=$(curl --silent -H 'Metadata-Flavor: Google' metadata/computeMetadata/v1/instance/network-interfaces/0/dns-servers)
echo "This is my DNS nameserver: $myDNS"
myDNS2=$(cat /etc/resolv.conf | grep "nameserver" | cut -d' ' -f 2)
#echo "$myDNS2"
myGEO=$(curl http://ip-api.com/json/$myExtIp --silent | jq -r '"\(.lat),\(.lon)"')
echo "This are my coordinates: $myGEO"
mySmail=$(curl --silent -H 'Metadata-Flavor: Google' metadata/computeMetadata/v1/instance/service-accounts/default/email)
echo "This is my service account: $mySmail"
myID=$(curl --silent -H 'Metadata-Flavor: Google' metadata/computeMetadata/v1/instance/id)
echo "This is my instance's ID: $myID"
myProjectID=$(curl --silent -H 'Metadata-Flavor: Google' metadata/computeMetadata/v1/project/project-id)
echo "This is my project id: $myProjectID"

