#!/bin/bash

echo Installing git, mono, mono-develop and their prerequisites. This adds a 3rd party reposistory that belongs to the official mono team.
sudo add-apt-repository ppa:directhex/monoxide
sudo apt-get update && sudo apt-get upgrade

sudo apt-get install git mono-develop mono-complete 

echo Installing SteamBot. Please enter password if prompted.

git clone https://github.com/Jessecar96/SteamBot.git

echo SteamBot has been cloned from git repository.

cd SteamBot/
mkdir packages/
cd packages/

wget http://nuget.org/nuget.exe

echo NuGet has been downloaded.

mozroots --import --sync

mono nuget.exe install Newtonsoft.Json -version 5.0.8

echo Newtonsoft.Json has been installed.

mono nuget.exe install protobuf-net -version 2.0.0.668

echo protobuf-net has been installed.

mono nuget.exe install SteamKit2 -version 1.5.0

echo SteamKit2 has been installed.

cd ..

while true; do
    read -p "Do you want to build the ExampleBot?" yn
    case $yn in
        [Yy]* ) mdtool build SteamBot.sln; echo "Built SteamTrade"; mdtool build --project:ExampleBot SteamBot.sln; echo ExampleBot has been built.; break;;
        [Nn]* ) echo "To build it yourself use the commands 'mdtool build SteamBot.sln' then 'mdtool build --project:ExampleBot SteamBot.sln'"; break;;
        * ) echo "Please answer yes or no.";;
    esac
done

cd Bin/Release/

echo You can use monodevelop to change the Bot code and it\'s setup. You can also compile it.
echo See https://github.com/Jessecar96/SteamBot/wiki/Configuration-Guide for configuration .
echo Run mono SteamBot.exe to run the bot.