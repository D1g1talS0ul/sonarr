# sonarr

On the OS I ran the following to copy the old config
cp -a /home/me/.config/NzbDrone/* /mnt/Plex/Sonarr/

docker run --restart always -d --name sonarr -p 8989:8989 -v /mnt/Plex/:/mnt/Plex/ -v /mnt/Plex/Sonarr:/home/me/.config/NzbDrone mine/sonarr
