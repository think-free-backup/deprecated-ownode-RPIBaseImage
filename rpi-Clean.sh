#!/bin/bash


# Change timezone

sudo dpkg-reconfigure tzdata

# Keyboard layout

sudo apt-get install console-data locales 
sudo dpkg-reconfigure console-data 
sudo dpkg-reconfigure locales

# Removing games

rm -rf python_games

# Some packages 

sudo apt-get purge x11-common midori lxde python3 python3-minimal

sudo apt-get purge `sudo dpkg --get-selections | grep "\-dev" | sed s/install//`

sudo apt-get purge `sudo dpkg --get-selections | grep -v "deinstall" | grep python | sed s/install//`
sudo apt-get purge lxde-common lxde-icon-theme omxplayer raspi-config

sudo apt-get purge `sudo dpkg --get-selections | grep -v "deinstall" | grep x11 | sed s/install//`

sudo apt-get purge gcc-4.4-base:armhf gcc-4.5-base:armhf gcc-4.6-base:armhf

sudo apt-get purge ca-certificates libraspberrypi-doc xkb-data fonts-freefont-ttf locales manpages

sudo apt-get purge liblapack3
sudo apt-get purge libatlas3-base
sudo apt-get purge penguinspuzzle
sudo apt-get purge gdb

sudo apt-get purge manpages # rm -fr /usr/share/doc/* /usr/share/man/*

sudo apt-get autoremove

sudo apt-get clean

# Audio

# sudo apt-get purge `sudo dpkg --get-selections | grep -v "deinstall" | grep sound | sed s/install//`

# Swap 

sudo swapoff -a 
cd /var 
sudo dd if=/dev/zero of=swap bs=1M count=100
mkswap /var/swap

# Logs

cd /var/log/ 
sudo rm `find . -type f`

# Shutdown

sudo shutdown now
