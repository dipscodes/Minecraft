#!/bin/bash

server_directory_name="LyadhCraft"
present_directory=$(pwd)
. $present_directory/configs/server.config

cd $HOME
rm -r $server_directory_name 
mkdir $server_directory_name
cd $server_directory_name

cp $present_directory/runmcserver.sh $HOME/$server_directory_name.