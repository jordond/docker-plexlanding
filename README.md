# PlexLanding Docker Container

A container for running [Plex Landing](https://github.com/jordond/plexlanding) application.
This is the preferred way of running Plex Landing

## Features

- Runs Plex Landing in a self contained environment, easy to reinstall/move around.
- Checks if an update is needed on every restart.  Will automatically update and compile.
- Ability to:
  - Persistently store the `/data` directory. (Useful for recreating image)
  - Change which branch to check for updates from

## Building

**NOTE** Until I have published this to docker hub you will have to:
- Clone the repo `git clone https://github.com/jordond/docker-plexlanding`
- Change into directory `cd docker-plexlanding`
- Build the docker image `docker build -t jordond/plexlanding .`

## Running

```
docker run -d \
  --name=plexlanding \
  --restart=always \
  -p <PORT>:8000 \
  -v <PATH_TO_DATA>:/data \
  jordond/plexlanding
```

### Options

- `-p <PORT>:8000`: Local port to map to server
- `-v <PATH_TO_DATA>:/data`: Directory to store all application data, ie: database, config, etc
- `-e branch=<BRANCH>`: _(optional)_ Which branch of plexlanding to use
  - Defaults to `master` branch
  - _Only change the branch if you know what your doing, as master is the release branch_


#License
```
The MIT License (MIT)

Copyright (c) 2016 Jordon de Hoog

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

```
