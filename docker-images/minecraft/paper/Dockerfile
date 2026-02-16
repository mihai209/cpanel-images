FROM openjdk:17-slim

RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*

WORKDIR /server

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 25565

ENTRYPOINT ["/entrypoint.sh"]
CMD ["java", "-Xms128M", "-Xmx1024M", "-Dterminal.jline=false", "-Dterminal.ansi=true", "-jar", "paper.jar"]
