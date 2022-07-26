docker run -d \
  --name=firefox \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Europe/Zurich \
  -p 3000:3000 \
  -v /tmp/firefox:/config \
  --shm-size="2gb" \
  --restart unless-stopped \
  lscr.io/linuxserver/firefox:latest
