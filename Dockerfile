FROM ubuntu:latest

ARG username=me

RUN \
ln -sf /usr/share/zoneinfo/US/Mountain /etc/localtime && \
apt-get update && \
apt install -y gnupg && \
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys FDA5DFFC && \
echo "deb http://apt.sonarr.tv/ master main" > \
        /etc/apt/sources.list.d/sonarr.list && \
apt-get update && \
apt-get install -y libmono-cil-dev nzbdrone && \
 apt-get clean && \
rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/* && \
useradd -s /bin/bash -m -G root $username

VOLUME ["/mnt/Plex"]

EXPOSE 8989

CMD ["/bin/su", "-l", "me", "-c /usr/bin/mono --debug /opt/NzbDrone/NzbDrone.exe -nobrowser"]
