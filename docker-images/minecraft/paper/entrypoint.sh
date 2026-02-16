#!/bin/bash
set -e

# Internal variables
export INTERNAL_IP=$(ip route get 1 | awk '{print $NF;exit}')

# Move to the container directory
cd /home/container || exit 1

# Download Paper if it doesn't exist
if [ ! -f paper.jar ]; then
    echo "Downloading Minecraft Paper (latest build)..."
    # This is a simplified download, in production you'd use the Paper API to find the latest build for a version
    curl -sSL "https://api.papermc.io/v2/projects/paper/versions/1.20.4/builds/381/downloads/paper-1.20.4-381.jar" -o paper.jar
fi

# Ensure EULA is accepted
if [ ! -f eula.txt ]; then
    echo "eula=true" > eula.txt
fi

# Print info
echo "Server starting on $INTERNAL_IP"
java -version

# Execute the startup command provided by the panel
eval "${STARTUP}"
