echo Updating Packages to avoid any issues. Please entire password if prompted.

zypper update

echo Installing git, mono, mono-develop and their prerequisites. Please enter password if prompted.
zypper install git mono-complete monodevelop

echo Installing SteamBot. 

git clone https://github.com/Jessecar96/SteamBot.git

echo SteamBot has been cloned from git repository.

cd SteamBot/
mkdir packages/
cd packages/

wget http://nuget.org/nuget.exe

echo NuGet has been downloaded.

mozroots --import --sync

echo Cxwertficates has been imported.

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

echo See https://github.com/Jessecar96/SteamBot/wiki/Configuration-Guide for configuration .
echo Run mono SteamBot.exe to run the bot.