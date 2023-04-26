#!/bin/sh

wget -N https://downloads.arduino.cc/arduino-1.8.16-linuxaarch64.tar.xz
sudo tar -C /opt -xvf arduino-1.8.16-linuxaarch64.tar.xz
rm arduino-1.8.16-linuxaarch64.tar.xz

cd /opt/arduino-1.8.16
sudo sh install.sh
