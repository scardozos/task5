#! /bin/bash

pckgs=$(dpkg-query -Wf '${Installed-Size}\t${Package}\n' | sort -nr | head -n10)
echo "Size Name " 
echo "$pckgs"
