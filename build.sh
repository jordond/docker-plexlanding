#!/bin/bash
#
# Build Application

echo "Grabbing the application source from master"
mkdir -p /tmp
git clone https://github.com/jordond/plexlanding /tmp/plexlanding

# Check if configuration file exists in config dir
if [ ! -f /config/config.json ]; then
  echo "Copying config file"
  cp /tmp/plexlanding/src/example.config.json /config/config.json
fi

# Install dependencies
echo "Installing node dependencies"
cd /tmp/plexlanding
npm install --production=false 2>&1# Needs dev deps too
gulp build

# Delete all dev deps
npm prune --production

# Copy build files and node deps to installation dir
echo "Moving application to /opt"
mkdir -p /opt/plexlanding
cp -r /tmp/plexlanding/build/* /opt/plexlanding
cp -r /tmp/plexlanding/node_modules /opt/plexlanding

# Delete temp dir
echo "Cleaning up"
cd /
chmod -R 755 /opt/plexlanding
rm -rf /tmp/plexlanding
