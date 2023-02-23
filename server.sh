#!/bin/bash

cd /home/mcadmin/ # needs to be generalilzed
rm -r LyadhCraft 
mkdir LyadhCraft
cd LyadhCraft

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
rm SERVER_MODS.zip
cd ..

# cp /home/mcadmin/template.properties /home/mcadmin/LyadhCraft/server.properties
cp /home/mcadmin/runmcserver.sh /home/mcadmin/LyadhCraft/runmcserver.sh
chmod +x /home/mcadmin/LyadhCraft/runmcserver.sh
cp /home/mcadmin/bootup.sh /home/mcadmin/LyadhCraft/bootup.sh
chmod +x /home/mcadmin/LyadhCraft/bootup.sh

# chown mcadmin:mcadmin -R .

# autostart and autoshutdown
service autostart stop
systemctl disable autostart.service
rm /etc/systemd/system/autostart.service

cp /home/mcadmin/autostart.service /etc/systemd/system/autostart.service
systemctl daemon-reload
systemctl enable autostart.service # enables the service for restart
# service autostart status
service autostart start # run the service for the first time


# autostart mc server
service runmcserver stop
systemctl disable runmcserver.service
rm /etc/systemd/system/runmcserver.service

cp /home/mcadmin/runmcserver.service /etc/systemd/system/runmcserver.service
systemctl daemon-reload
systemctl enable runmcserver.service # Service enables the server for restart
# service runmcserver status
chown mcadmin:mcadmin -R /home/mcadmin/LyadhCraft
service runmcserver start # run the server for the first time

# journalctl -fu runmcserver.service
