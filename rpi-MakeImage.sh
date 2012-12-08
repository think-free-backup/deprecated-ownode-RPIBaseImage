#!/bin/bash

DATE=`date +%Y-%m-%d-at-%H-%M-%S`

sudo dd if=/dev/$1 of=Ownode-RPiImage-$DATE.img
# mkdir mnt 
# sudo mount -o loop,offset=$((512*122880)) Ownode-RPiImage-$DATE.img mnt 
# sudo sfill -z -l -l -f mnt 
# sudo umount mnt
# sudo rm -rf mnt
