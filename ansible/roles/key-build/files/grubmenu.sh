#!/bin/bash

GRUB_CONFIG=`sudo find /boot -name "grub.cfg"`
grep 'menuentry ' $GRUB_CONFIG | cut -f 2 -d "'" | nl -v 0
grub2-mkconfig -o $GRUB_CONFIG
grub2-set-default 0