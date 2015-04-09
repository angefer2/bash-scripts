#!/bin/bash
# Descrição: realiza instalação do samba server no Debian

if [[ "$UID" != 0 ]]; then
	echo "Ops! Você precisa ter privilégios de root para rodar este script..."
	exit 1
fi

InsSamba () {
	echo "Iniciando instalação do Samba..."
	echo "Tem certeza de que deseja continuar? [s/n]"
	read RESPOSTA

	if [[ "$RESPOSTA" == "s" ]]; then
		apt-get install -y samba
	else
		echo "Este script será encerrado!"
		exit 1
	fi
}

ConfArqConf () {
	if [[ -e /etc/samba/smb.conf ]]; then
		echo "Arquivo de configuração do Samba presente!"
	else
		echo "Ops! Arquivo de configuração do Samba não está presente!"
	fi
}

MenuPrincipal () {
	while true
	do
		echo
		echo " *** Instalador do Samba em Sistemas Debian ***"
		echo "Escolha uma das opções:"
		echo 
		echo "InsSamba - Para instalação do Samba Server"
		echo "ConfArqConf - Para conferir a presença do smb.conf"
		echo
		read RESPOSTA

		case $RESPOSTA in

			InsSamba) InsSamba
			;;

			ConfArqConf) ConfArqConf
			;;

		esac
		done
}

MenuPrincipal
