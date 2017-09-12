#!/bin/bash

cd /tmp
git clone https://github.com/joyent/mdata-client.git
cd /tmp/mdata-client && make
cp /tmp/mdata-client/mdata-get /usr/bin
