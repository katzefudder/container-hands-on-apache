# Docker hands on
* docker build --force-rm -t apache-test .
* docker run -p 8080:80 -v $PWD/web:/var/www apache-test