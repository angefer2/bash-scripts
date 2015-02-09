#!/bin/bash
dpkg --add-architecture i386
apt-get update
cd ~
wget -O skype-install.deb http://www.skype.com/go/getskype-linux-deb
dpkg -i skype-install.deb
apt-get -f install
rm skype-install.deb
echo "Concluído"
