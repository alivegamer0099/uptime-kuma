#!/bin/bash

# Change directory to the mounted application path
cd /home/container

# Install Node.js and npm if not already installed
if ! command -v node &> /dev/null
then
    echo "Node.js could not be found, installing..."
    curl -sL https://deb.nodesource.com/setup_14.x | bash -
    apt-get install -y nodejs
fi

# Install Uptime Kuma dependencies
npm install

# Build the application (only necessary if not already built)
npm run build

# Start Uptime Kuma
npm run start-server
