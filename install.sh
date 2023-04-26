#!/bin/bash

echo "" >> ~/.bashrc
echo "# share history among terminals" >> ~/.bashrc
echo 'export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"' >> ~/.bashrc
echo "shopt -u histappend" >> ~/.bashrc
source ~/.bashrc

sudo apt update
sudo apt install -y curl
bash ~/install_arduino.sh
sudo apt install -y terminator

mkdir -p ~/.config/autostart
cp /usr/share/applications/vino-server.desktop ~/.config/autostart/
gsettings set org.gnome.Vino prompt-enabled false
gsettings set org.gnome.Vino require-encryption false
gsettings set org.gnome.Vino authentication-methods "['vnc']"
gsettings set org.gnome.Vino vnc-password $(echo -n 'swarm'|base64)

sudo nvpmodel -m 0

bash ~/install_ros.sh

#bash ~/install_opencv.sh
