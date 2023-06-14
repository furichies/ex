echo -e 'FROM alpine\nMAINTAINER res@res.es\nCMD [ "/bin/sh" ]' > Dockerfile
docker build -t alpine2 .


