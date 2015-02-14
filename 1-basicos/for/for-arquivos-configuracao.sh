#!/bin/bash

for arquivo in /etc/*/*.conf
do
	tput setaf 4 
	echo -n "Arquivos de configuração: "
	tput sgr0
	tput setaf 3 # Mudando cor da lista de arquivos
	echo "$arquivo"
	tput sgr0
done

