#!/bin/bash

cd /root/nata2

if [ -z "$DBURL" ] ; then
    cp config.sample.toml config.toml
else
    echo "dburl = \"$DBURL\"" > config.toml
fi

cat config.toml
# ./bin/nata2server_init_database
bundle exec rackup -o 0.0.0.0 -p 9292
