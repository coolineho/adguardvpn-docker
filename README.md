# adguardvpn-docker
AdguardTeam/AdGuardVPNCLI for Linux in a docker image including a kill switch and the torrent client transmission-daemon.
## How to install
### 1. Install Docker
For example by using the [official install script](https://get.docker.com).

### 2. Get the files from this repository
For example, using Git: `git pull git@github.com:artuselias/adguardvpn-docker.git`.

Make sure Git is installed (`sudo apt install git` on Ubuntu) and that the current directory is writable.

### 3. Adjust environment variables
The environment variables for this docker container are stored in a file called `.env`.

`ADGUARD_USERNAME` and `ADGUARD_PASSWORD` need to be specified in order to enable automatic login.

Be sure to set `DOWNLOADS_PATH` to a path in your file system where the downloaded torrents should be stored.

Note that if `KILLSWITCH` is set to `enabled`, the container may send requests to `ipinfo.io`.

You can copy and adjust the file `.env.example`:
```
cd adguardvpn-docker
cp .env.example .env
nano .env
```

### 4. Build the Docker image
`sudo docker build -t adguard-vpn .`

### 5. Bring the Docker container up
`sudo docker compose up -d`

## How to check everything is working
### Check VPN status
`sudo docker exec -it adguard-vpn adguardvpn-cli status`
### Check killswitch status
`sudo docker exec -it adguard-vpn killswitch status`

## How to use
The Transmission web interface is accessible on [http://localhost:9091/transmission/web/](http://localhost:9091/transmission/web/).

The downloaded files are stored in the directory specified in the environment variable `DOWNLOADS_PATH`.

## Read more
- [linuxserver/transmission on Docker hub](https://hub.docker.com/r/linuxserver/transmission)
- [AdGuard VPN CLI for Linux](https://adguard-vpn.com/en/linux/overview.html)
