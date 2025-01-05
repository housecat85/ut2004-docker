# Unreal Tournament 2004 Dedicated Server Dockerfile
FROM debian:bullseye

# Install required dependencies
RUN apt-get update && \
    apt-get install -y wget unzip lib32gcc-s1 && \
    mkdir -p /ut2004

# Download and extract the UT2004 dedicated server files
WORKDIR /ut2004
RUN wget https://files.tuxfamily.org/kgames/ut2004/ut2004-dedicated-server-3339-2-linux.zip && \
    unzip ut2004-dedicated-server-3339-2-linux.zip && \
    rm ut2004-dedicated-server-3339-2-linux.zip

# Expose the necessary ports
EXPOSE 7777/udp 7778/udp 7787/udp 8075/tcp

# Start the server with default settings
CMD ["./ucc-bin", "server", "DM-Antalus?game=GameTypes.DeathMatch?AdminName=admin?AdminPassword=password", "-nohomedir"]
