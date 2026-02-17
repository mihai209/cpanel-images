ARG JAVA_VERSION=17
FROM eclipse-temurin:${JAVA_VERSION}-jdk

RUN apt-get update && apt-get install -y curl iproute2 && rm -rf /var/lib/apt/lists/*
RUN if getent group 1000; then groupmod -n container $(getent group 1000 | cut -d: -f1); else groupadd -g 1000 container; fi && \
    if getent passwd 1000; then usermod -l container -d /home/container -m $(getent passwd 1000 | cut -d: -f1); else useradd -u 1000 -g 1000 -m -d /home/container -s /bin/bash container; fi

WORKDIR /home/container

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh && chown container:container /entrypoint.sh

USER container
ENV USER=container HOME=/home/container

EXPOSE 25577

ENTRYPOINT ["/entrypoint.sh"]
