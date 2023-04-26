#!/bin/bash

PWD="swarm"

mkdir ~/camera_overrides
cd ~/camera_overrides

wget https://waveshare.com/w/upload/e/eb/Camera_overrides.tar.gz
tar zxvf Camera_overrides.tar.gz
echo $PWD | sudo -S cp camera_overrides.isp /var/nvidia/nvcam/settings/
echo $PWD | sudo -S chmod 664 /var/nvidia/nvcam/settings/camera_overrides.isp
echo $PWD | sudo -S chown root:root /var/nvidia/nvcam/settings/camera_overrides.isp

cd
rm -r ~/camera_overrides

