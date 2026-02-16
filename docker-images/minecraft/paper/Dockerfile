ARG JAVA_VERSION=17
FROM eclipse-temurin:${JAVA_VERSION}-jdk

RUN apt-get update && apt-get install -y curl iproute2 && rm -rf /var/lib/apt/lists/*
RUN useradd -m -d /home/container -s /bin/bash container

WORKDIR /home/container

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh && chown container:container /entrypoint.sh

USER container
ENV USER=container HOME=/home/container

EXPOSE 25565

ENTRYPOINT ["/entrypoint.sh"]
