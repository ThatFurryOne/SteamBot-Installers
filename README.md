#SteamBot Linux Install Scripts:

These scripts install the [SteamBot project](https://github.com/JesseCar96/SteamBot/) and can build the ExampleBot if you wish.

They install mono, monodevelop, git, the required dependencies for SteamBot and the SteamBot project itself.

These are released under the MIT License, please see LICENSE for more information.

At this moment in time, only one distro is supported:
* OpenSUSE
* Ubuntu - Uses a 3rd party repository - Owned by the offical mono team.

- There are mono issues on Debian which need to to be sorted out first before I can release the script.

###Instructions:

Clone this project or download the [snapshot](https://github.com/DevMuppetds/SteamBot-Linux/archive/master.zip) file. 

	git clone https://github.com/DevMuppetds/SteamBot-Linux.git

Run the following commands in terminal using root privelages for your system (sudo or su).
	
	cd SteamBot-Linux
	chmod 775 <distro>.sh
	./<distro>.sh

###Coming soon: 
* Fedora support
* Debian support
