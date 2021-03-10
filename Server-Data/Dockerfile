FROM steamcmd/steamcmd:latest

# TCP / UDP Ports
EXPOSE 2456/TCP
EXPOSE 2457/TCP
EXPOSE 2458/TCP

EXPOSE 2456/UDP
EXPOSE 2457/UDP
EXPOSE 2458/UDP

# Install Valheim Server
RUN /root/.steam/steamcmd/steamcmd.sh +login anonymous +force_install_dir /data +app_update 896660 +quit

# Overwrite Valheim Server Configuration
COPY ./start_server.sh /data/start_server.sh
RUN chmod u+x /data/start_server.sh

ENTRYPOINT [ "/bin/bash", "-c", "cd /data && ./start_server.sh" ]