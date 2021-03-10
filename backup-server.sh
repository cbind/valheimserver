#!/bin/bash

DIRDATE=$(date +"%Y%m%d-%H%M%S")

# Maximum amount of backups inside the backup root directory
MAXIMUM_BACKUPS=10

# Current location for the backup
BACKUPROOT=/home/valheim/my-mounted-cloud-directory
BACKUPDIR=$BACKUPROOT/$DIRDATE

echo "#######################################"
echo "## Backup Start: `date`"

# Shutdown Valheim server
echo "## Shutdown server for a new backup"
docker stop cbind-valheimserver

# Backup files to hidrive
echo "## Backup data to HiDrive"
mkdir $BACKUPDIR
cp -rv /home/valheim/server/Server-Data/Backup/. $BACKUPDIR

# Only keep the last MAXIMUM_BACKUPS
echo "## Delete all directories except the last $MAXIMUM_BACKUPS"
cd /home/valheim/hidrive-backup/
ls -rp | grep '/$' | tail -n +$MAXIMUM_BACKUPS | xargs -I {} rm -r -- {}

# Start Valheim server
echo "## Start server again"
cd /home/valheim/server
./run-server.sh