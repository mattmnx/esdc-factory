#!/bin/bash
sectorend=$(fdisk /dev/vda -l |grep "Disk /dev/vda" | cut -d" " -f 7)
current=$(fdisk /dev/vda -l |tail -1 |cut -d" " -f 9)
difference=`expr $sectorend - $current`
if [ $difference -gt 100 ]; then
    growpart /dev/vda 1
    pvresize /dev/vda1
    lvresize --resizefs -l +100%FREE /dev/mapper/rootvg-rootlv
fi