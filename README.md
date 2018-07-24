# ytnobody/docker-nata2-server

[nata2-server](https://github.com/studio3104/nata2) on docker container

## synopsis

    $ sudo docker pull ytnobody/nata2-server
    $ sudo docker run \
        --name nata2 \
        -e DBURL=mysql2://nata:password@localhost/nata2 \
        -p 9292:9292 \
        -d ytnobody/nata2-server

## environment variables

* DBURL - specifier dburl of [Sequel](http://sequel.jeremyevans.net/) that used by nata2-server

## exposed port

* 9292/tcp
