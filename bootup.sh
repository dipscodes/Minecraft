#!/bin/bash

timedatectl set-timezone Asia/Kolkata
currenttime=$(date +%H%M)
if [ "$currenttime" -gt 1400 ] && [ "$currenttime" -lt 1430 ]; then
	echo Server illegally started at $(date) >> /home/mcadmin/server.log
	shutdown now
else 
	shutdown 02:00
	echo $(date) >> /home/mcadmin/server.log
fi