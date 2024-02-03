#!/bin/bash

echo "PING SWEEPER"

echo "Enter your IP Address, 1st 3 octets only ex: 192.168.0"
read -p "IP: " IP
echo "Enter file to save results"
read -p "file: " file

if [ "$IP" == "" ] && [ "$file" == "" ]; then
	echo "No IP address and filename entered, try again"
	exit 1
elif [ "$IP" == "" ]; then
	echo "No IP address specified!, try again"
	exit 1
elif [ "$file" == "" ]; then
	echo "No filename specified!, try again"
else

	for ip in $(seq 1 254); do
		ping -c 1 $IP.$ip | grep "64 bytes" | cut -d " " -f 4 | tr -d ":" >> $file &
	done 
	wait
	echo "Done, cat the file $file"
fi

