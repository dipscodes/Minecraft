#!/bin/bash

# apt update
# apt upgrade
# apt install unzip python3-pip -y
# pip install gdown
# apt install openjdk-17-jdk -y
cd /home/mcadmin/ # needs to be generalilzed
rm -r LyadhCraft 
mkdir LyadhCraft
cd LyadhCraft
# rm -r *
# cp /home/mcadmin/bootup.sh /home/mcadmin/LyadhCraft/bootup.sh
curl -OJ https://meta.fabricmc.net/v2/versions/loader/1.19.2/0.14.14/0.11.1/server/jar  # server download 1.19.2
files=(*) # files = (star)
echo "${files[0]}"
mv ${files[0]} server.jar
chmod +x server.jar
/usr/bin/java -Xmx2G -jar server.jar nogui
sed -i "s/^eula.*/eula=TRUE/" eula.txt
cd mods
gdown 1oUTF5Z3XSjebRIh2qdaPtxUazhGXp5_y  # specific server mods zip file
unzip SERVER_MODS.zip
# rm SimplerAuth-1.6.0.jar
rm SERVER_MODS.zip
cd ..

rm /etc/systemd/system/autostart.service

cp /home/mcadmin/bootup.sh /home/mcadmin/LyadhCraft/bootup.sh
chmod +x /home/mcadmin/LyadhCraft/bootup.sh

chown mcadmin:mcadmin -R .

service autostart stop

echo -e "[Unit]\n\
Description=Minecraft Test Service\n\
\n\
[Service]\n\
# User=minecraft\n\
# Group=minecraft\n\
WorkingDirectory=/home/mcadmin/LyadhCraft\n\
ExecStart=sh /home/mcadmin/LyadhCraft/bootup.sh\n\
RestartSec=10\n\
Restart=always\n\
\n\
[Install]\n\
WantedBy=multi-user.target" > /etc/systemd/system/autostart.service

systemctl daemon-reload
systemctl enable autostart.service # enables the server for restart
systemctl daemon-reload
service autostart status
service autostart start # run the server for the first time
cat /etc/systemd/system/autostart.service
journalctl -fu autostart.service
# service autostart.service stop
# /usr/bin/java -Xmx6G -jar server.jar nogui  # run the server command
