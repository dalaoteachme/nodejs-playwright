#!/bin/bash
cd /home/container

# Output Node.js version
node -v

# Install dependencies
npm install

# Run startup command if specified, otherwise default to node index.js
if [ -n "$STARTUP" ]; then
    eval $STARTUP
else
    node index.js
fi