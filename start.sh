#!/bin/bash

cd /opt/app

# Auto update and install dependencies
git pull
npm install --silent --unsafe-perm

# Build and run app in production
npm run build

node /opt/app/dist/server
