#!/bin/bash

cd /opt/app

# Auto update and install dependencies
git pull
npm install --silent --unsafe-perm

# Build and run app in production
npm run build

# Expose variables
NODE_DOCKER=true
NODE_ENV=production
PORT=8000

node /opt/app/dist/server
