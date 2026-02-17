#!/bin/bash
set -e

cd /home/container || exit 1

echo "--- BungeeCord Startup Diagnostics ---"
id
ls -la /home/container
echo "--------------------------------------"

if [ ! -f BungeeCord.jar ]; then
    echo "Downloading latest stable BungeeCord..."
    curl -sSL "https://ci.md-5.net/job/BungeeCord/lastStableBuild/artifact/bootstrap/target/BungeeCord.jar" -o BungeeCord.jar
fi

echo "Proxy starting on ${SERVER_IP:-0.0.0.0}:${SERVER_PORT:-25577}"
java -version

DEFAULT_STARTUP="java -Xms128M -Xmx${SERVER_MEMORY:-512}M -jar BungeeCord.jar"
eval "${STARTUP:-$DEFAULT_STARTUP}"
