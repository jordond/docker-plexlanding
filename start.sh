#!/bin/bash

# Expose variables
NODE_ENV='production'
NODE_DOCKER=true
PORT=8000

cd /opt/app

# Auto update and install dependencies
git pull
npm install --unsafe-perm

npm run build
npm start
