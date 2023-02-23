#!/bin/bash

timedatectl set-timezone Asia/Kolkata
currenttime=$(date +%H%M)
echo $currenttime
if [ "$currenttime" -gt 0200 ] && [ "$currenttime" -lt 1000 ]; then
	echo Server illegally started at $(date) >> /home/mcadmin/server.log
	shutdown now
else 
	shutdown 02:00
	echo Server normally started at $(date) >> /home/mcadmin/server.log
fi
