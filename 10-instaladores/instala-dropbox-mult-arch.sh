#!/bin/bash

echo "*** Instalador de Dropbox ***"
echo "Digite 1 para arquitetura 32 bits ou 2 para 64 bits:"
read ARQUITETURA

case $ARQUITETURA in

	1) cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86" | tar xzf -;;
	
	2) cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -;;

	*) echo "Opção indisponível...";
	exit 0;;

esac

if [[ -f ~/.dropbox-dist/dropboxd ]]; then
	~/.dropbox-dist/dropboxd
else
	echo "Ops! Ocorreu um erro na instalação..."
fi
