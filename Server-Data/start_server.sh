#!/bin/bash
export templdpath=$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=./linux64:$LD_LIBRARY_PATH
export SteamAppId=892970

echo "Starting server PRESS CTRL-C to exit"

# Tip: Make a local copy of this script to avoid it being overwritten by steam.
# NOTE: Minimum password length is 5 characters & Password cant be in the server name.
# NOTE: You need to make sure the ports 2456-2458 is being forwarded to your server through your local router & firewall.
# NOTE: Set "-public 1" for a public server which can be found in the community server list
./valheim_server.x86_64 -name "<choose a server name here>" -port 2456 -nographics -batchmode -world "<choose the name of your world>" -password "<chose the connection password>" -public 0

export LD_LIBRARY_PATH=$templdpath