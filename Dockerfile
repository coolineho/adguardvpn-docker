FROM lscr.io/linuxserver/transmission:latest
WORKDIR /app
ENV USER="root"
RUN apk add curl docker nano && \
  mkdir /opt/adguardvpn_cli && \
  mkdir /custom-cont-init.d && \
  mkdir -p /dev/net && \
  mknod /dev/net/tun c 10 200 && \
  echo "* * * * * /cronjob" >> /etc/crontabs/root && \
  curl -fsSL https://raw.githubusercontent.com/AdguardTeam/AdGuardVPNCLI/HEAD/scripts/release/install.sh | sed 's/read -r response < \/dev\/tty/response=y/' | sh -s -- -v 

COPY cronjob /
COPY functions.sh /
COPY adguard_config /custom-cont-init.d
COPY run /etc/s6-overlay/s6-rc.d/svc-transmission/run
