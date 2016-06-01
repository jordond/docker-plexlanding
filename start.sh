#!/bin/bash

# Expose variables
NODE_DOCKER=true

cd /opt/app

# Auto update and install dependencies
git pull
npm install --unsafe-perm

# Build and run app in production
npm run build
npm start
