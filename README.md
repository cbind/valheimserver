# Docker Valheim Dedicated Server

This is a little implementation of my own dedicated Valheim server which is running in docker.

## Installation

1. Copy or checkout the complete directory onto the host linux system. I created a new user `valheim` on my server and I copied all files into the `/home/valheim/server/` directory.
2. Setting up the `./Server-Data/start_server.sh` script which is the entry point inside the docker container. You have to choose a server name, a world name and if you want a password. For more info visit [https://valheim.fandom.com/wiki/Hosting_Servers](https://valheim.fandom.com/wiki/Hosting_Servers).
3. Set execute permissions for `run-server.sh` and `backup-server.sh`.
```bash
sudo chmod u+x run-server.sh backup-server.sh
```
4. Install docker on your host linux system (e.g. see [https://docs.docker.com/engine/install/ubuntu/](https://docs.docker.com/engine/install/ubuntu/) for installing docker on Ubuntu).
5. Make sure the TCP and UDP ports 2456-2458 are opened for incoming traffic in your server firewall/router.

## Start the server
You can just execute the `./run-server.sh` inside the root directory to run the docker container. You can manually stop the server with `docker stop cbind-valheimserver`.

## Backup
I've created the backup-script `./backup-server.sh` to copy all files from the docker container volume (`./Server-Data/Backup`) to a separate backup directory. The script stops the running docker container, makes the backup and starts the container again. Feel free to change everything you want. You can execute the script automatically over the linux `crobtab` functionality. In my scenario I am using a mounted directory to my cloud for the backup destination.