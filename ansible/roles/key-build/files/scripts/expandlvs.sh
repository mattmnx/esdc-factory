#!/bin/bash
sectorend=$(fdisk /dev/vda -l |grep "Disk /dev/vda" | cut -d" " -f 7)
current=$(fdisk /dev/vda -l |tail -1 |cut -d" " -f 9)
difference=`expr $sectorend - $current`
if [ $difference -ne 1 ]; then
    echo -e "n\np\n\n\n\nw\nq\n" | fdisk /dev/vda
    partprobe
fi
IFS=$'\n'
for partition in `fdisk /dev/vda -l |grep "Linux$"`; do
        addtolv=$(echo $partition | cut -d" " -f1)
        pvcreate $addtolv
        vgextend rootvg $addtolv
        lvresize --resizefs -l +100%FREE /dev/mapper/rootvg-rootlv
        partnum=${addtolv: -1}
        echo -e "t\n$partnum\n8e\nw\n" | fdisk /dev/vda
done