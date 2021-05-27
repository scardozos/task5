#!/bin/bash
myip=$(curl --silent -H 'Metadata-Flavor: Google' metadata/computeMetadata/v1/instance/network-interfaces/0/ip)
echo "$myip"
myMAC=$(curl --silent -H 'Metadata-Flavor: Google' metadata/computeMetadata/v1/instance/network-interfaces/0/mac)
echo "$myMAC"
myExtIP=$(curl --silent -H 'Metadata-Flavor: Google' metadata/computeMetadata/v1/instance/network-interfaces/0/access-configs/0/external-ip)
echo "$myExtIP"
myDNS=$(curl --silent -H 'Metadata-Flavor: Google' metadata/computeMetadata/v1/instance/network-interfaces/0/dns-servers)
echo "$myDNS"
myDNS2=$(cat /etc/resolv.conf | grep "nameserver" | cut -d' ' -f 2)
#echo "$myDNS2"
myGEO=$(curl http://ip-api.com/json/$myExtIp --silent | jq -r '"\(.lat),\(.lon)"')
echo "$myGEO"
mySmail=$(curl --silent -H 'Metadata-Flavor: Google' metadata/computeMetadata/v1/instance/service-accounts/default/email)
echo "$mySmail"
myID=$(curl --silent -H 'Metadata-Flavor: Google' metadata/computeMetadata/v1/instance/id)
echo "$myID"
myProjectID=$(curl --silent -H 'Metadata-Flavor: Google' metadata/computeMetadata/v1/project/project-id)
echo "$myProjectID"

