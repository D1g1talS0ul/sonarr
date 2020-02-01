FROM ubuntu:latest

ARG DEBIAN_FRONTEND="noninteractive"

RUN \
ln -sf /usr/share/zoneinfo/US/Mountain /etc/localtime && \
useradd -s /bin/bash -m -G root sonarr && \
apt-get update && \
apt install -y gnupg ca-certificates && \
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 2009837CBFFD68F45BC180471F4F90DE2A9B4BF8 && \
echo "deb https://apt.sonarr.tv/ubuntu bionic main" | tee /etc/apt/sources.list.d/sonarr.list && \
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF && \
echo "deb https://download.mono-project.com/repo/ubuntu stable-bionic main" | tee /etc/apt/sources.list.d/mono-official-stable.list && \
apt-get update && \
apt-get install -y mono-devel sonarr && \
apt-get clean && \
rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*

EXPOSE 8989

CMD ["/bin/su", "-l", "sonarr", "-c /usr/bin/mono --debug /usr/lib/sonarr/bin/Sonarr.exe -nobrowser"]
