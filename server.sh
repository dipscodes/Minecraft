#!/bin/bash

server_directory="LyadhCraft"
present_directory=$(pwd)
. $present_directory/configs/server.config

cd $HOME
rm -r $server_directory 
mkdir $server_directory
cd $server_directory

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

cp $present_directory/configs/runmcserver.sh $HOME/$server_directory/runmcserver.sh
chmod +x $HOME/$server_directory/runmcserver.sh
cp $present_directory/configs/bootup.sh $HOME/$server_directory/bootup.sh
chmod +x $HOME/$server_directory/bootup.sh

chown $USER:$USER -R .

# autostart and autoshutdown
service autostart stop
systemctl disable autostart.service
rm /etc/systemd/system/autostart.service

cp $present_directory/configs/autostart.service /etc/systemd/system/autostart.service
systemctl daemon-reload
systemctl enable autostart.service # enables the service for restart
service autostart status
service autostart start # run the service for the first time


# autostart mc server
service runmcserver stop
systemctl disable runmcserver.service
rm /etc/systemd/system/runmcserver.service

cp $present_directory/configs/runmcserver.service /etc/systemd/system/runmcserver.service
systemctl daemon-reload
systemctl enable runmcserver.service # enables the server for restart
service runmcserver status
service runmcserver start # run the server for the first time

chown mcadmin:mcadmin -R .
journalctl -fu runmcserver.service
