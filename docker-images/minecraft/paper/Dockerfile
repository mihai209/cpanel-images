ARG JAVA_VERSION=17
FROM eclipse-temurin:${JAVA_VERSION}-jdk

RUN apt-get update && apt-get install -y curl iproute2 && rm -rf /var/lib/apt/lists/*

WORKDIR /home/container

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 25565

ENTRYPOINT ["/entrypoint.sh"]
