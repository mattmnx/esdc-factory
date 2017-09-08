#!/bin/bash
#rootpw=$(cat /etc/shadow | grep "^root" | cut -d":" -f2)
rootpw=$(cat /etc/shadow | grep "^root" | cut -d":" -f2)
blankpw="*"
if [ $rootpw=$blankpw ]; then
	rpw=$(mdata-get root_pw)
	chpasswd <<<"root:$rpw"
fi