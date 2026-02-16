#!/bin/bash
set -e

# Default version if not specified
MINECRAFT_VERSION=${MINECRAFT_VERSION:-"1.20.1"}

if [ ! -f paper.jar ]; then
    echo "Downloading Minecraft Paper $MINECRAFT_VERSION..."
    # Note: In a real scenario, we'd fetch the latest build from the PaperMC API properly.
    # This URL is an example for 1.20.1 build 196.
    curl -o paper.jar https://api.papermc.io/v2/projects/paper/versions/1.20.1/builds/196/downloads/paper-1.20.1-196.jar
fi

if [ ! -f eula.txt ]; then
    echo "eula=true" > eula.txt
fi

exec "$@"
