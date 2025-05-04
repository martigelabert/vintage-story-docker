# https://wiki.vintagestory.at/Guide:Dedicated_Server#Dedicated_server_on_Linux
ARG DOCKER_FROM=mcr.microsoft.com/dotnet/sdk:7.0
ARG DOCKER_FROM=mcr.microsoft.com/dotnet/sdk:7.0
FROM ${DOCKER_FROM} AS builder
RUN apt update
RUN apt -y install procps screen
RUN mkdir /home/vintagestory
WORKDIR "/home/vintagestory" 
RUN mkdir server
WORKDIR "/home/vintagestory/server" 
RUN wget https://cdn.vintagestory.at/gamefiles/stable/vs_server_linux-x64_1.20.9.tar.gz 
RUN tar xzf vs_server_linux-x64_*.*.*.tar.gz && rm vs_server_linux-x64_*.*.*.tar.gz 
RUN chmod +x server.sh
RUN useradd vintagestory -s /sbin/nologin -m

EXPOSE 42420/tcp
EXPOSE 42420/udp

#USER vintagestory
COPY entrypoint.sh /home/vintagestory/entrypoint.sh

#ENTRYPOINT ["tail", "-f", "/dev/null"]
ENTRYPOINT ["/home/vintagestory/entrypoint.sh"]