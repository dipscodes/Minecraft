#!/bin/bash

# timedatectl set-timezone Asia/Kolkata
ct=$(date +%H%M)
cd=$(date +%u)
ct=1300
cd=5

if [[ "$ct" -gt 0200 ] && [ "$ct" -lt 1000 ]] || [[ $cd -gt 0 ] && [ $cd -lt 5 ]] || [[ "$ct" -lt 1600 ] && [ $cd == 5 ]]; then
    echo Server illegally started at $(date) >> /home/dips/server_1.log
    shutdown now
    exit 0
fi

shutdown 02:00
echo Server normally started at $(date) >> /home/dips/server_1.log
