#!/bin/bash
# Descrição: mostra o nome dos usuários
# presentes no sistema

# Usando awk para pegar somente o nome dos usuários
USUARIOS=$(cat /etc/passwd | awk -F: '{print $1}')

for nome in $USUARIOS
do
	echo "Há no sistema: " $nome
done

# FIM
