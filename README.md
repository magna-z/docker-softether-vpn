[SoftEther VPN Project](https://www.softether.org)
==================================================

Based on Alpine Linux.

Documentation:
 - [vpnserver](https://www.softether.org/4-docs/1-manual/3._SoftEther_VPN_Server_Manual)
 - [vpnclient](https://www.softether.org/4-docs/1-manual/4._SoftEther_VPN_Client_Manual)
 - [vpnbridge](https://www.softether.org/4-docs/1-manual/5._SoftEther_VPN_Bridge_Manual)
 - [vpncmd](https://www.softether.org/4-docs/1-manual/6._Command_Line_Management_Utility_Manual)

Current version: **4.25, Build 9656, rtm**

### Prepare and run (with directory "/var/docker/softether-vpn" as example)
```bash
mkdir -p /var/docker/softether-vpn && \
cd /var/docker/softether-vpn && \
\
touch vpn_server.config && \
mkdir -p packet_log security_log server_log && \
chmod 600 vpn_server.config && \
chmod 700 packet_log security_log server_log && \
\
docker run -d \
    --restart always \
    --name softether-vpn \
    --network host \
    -v $PWD/vpn_server.config:/usr/vpnserver/vpn_server.config:rw \
    -v $PWD/packet_log:/usr/vpnserver/packet_log:rw \
    -v $PWD/security_log:/usr/vpnserver/security_log:rw \
    -v $PWD/server_log:/usr/vpnserver/server_log:rw \
    magnaz/softether-vpn:4.25-9656
```
