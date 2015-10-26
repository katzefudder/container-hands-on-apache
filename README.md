# Docker Hands On

## Build container
* docker build --force-rm -t apache-test .

## Run container
* docker run --name test1 -p 8080:80 -v $PWD/web:/var/www/html -d apache-test