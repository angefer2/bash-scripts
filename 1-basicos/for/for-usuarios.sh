#!/bin/bash
# Descrição: mostra o nome dos usuários
# presentes no sistema

USUARIOS=$(cat /etc/passwd | awk -F: '{print $1}')

for nome in $USUARIOS
do
	echo "Há no sistema: " $nome
done
