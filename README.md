# PlexLanding Docker Container

A soon to be container for my [Plex Landing](https://github.com/jordond/plexlanding) application.

## Run the container

Sample command to create container.

```
docker run -d                          \
  --restart=always                     \
  --name=plexlanding                   \
  -p 8444:8444                         \
  -e NODE_ENV=production               \
  -v /appdata/apps/plexlanding:/config \
  -v /etc/localtime:/etc/localtime:ro  \
  jordond/plexlanding
```

## (Purposed) Options
- `-p 8444:8444`: Which port to run on
- `-e NODE_ENV=(production|development)`: Enviroment to run in, **production** is recommended
- `-v /path/to:/config`: Persistant location to store application config and data

#License
```
The MIT License (MIT)

Copyright (c) 2015 Jordon de Hoog

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
