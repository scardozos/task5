#!/bin/bash
rm *.log
./script.sh | tee ./script.log
./table-packages.sh | tee ./packages.log
./table-script.sh | tee ./last.log
./style.sh | tee ./style.log

./table.sh "Metadata info"< script.log > /var/www/html/index.html
./table.sh "Last 10  Packages installed (Sorted by descending size) "< packages.log >> /var/www/html/index.html
./table.sh "Last connected users in this instance" < last.log >> /var/www/html/index.html
cat style.log >> /var/www/html/index.html
