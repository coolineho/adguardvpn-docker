FROM lscr.io/linuxserver/transmission:latest
WORKDIR /app
ENV USER="root"
RUN apk add curl tar iptables && \
  mkdir /opt/adguardvpn_cli && \
  mkdir /custom-cont-init.d && \
  mkdir -p /dev/net && \
  mknod /dev/net/tun c 10 200 && \
  echo "* * * * * killswitch" >> /etc/crontabs/root && \
  curl -fsSL https://raw.githubusercontent.com/AdguardTeam/AdGuardVPNCLI/master/scripts/beta/install.sh | sed 's/read -r response < \/dev\/tty/response=y/' | sh -s -- -v 

COPY killswitch /usr/local/bin
COPY adguard_config /custom-cont-init.d
