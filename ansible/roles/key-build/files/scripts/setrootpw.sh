#!/bin/bash
rpw=$(mdata-get root_pw)
chpasswd <<<"root:$rpw"