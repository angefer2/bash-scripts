#!/bin/bash

# Verificando se o usuário está usando parâmetros...
if [[ -z $1 ]]; then
	echo "Você precisa informar parâmetros..."
fi

i=1
while [ -n "$1" ]
	do echo "o parâmetro $i tem o valor $1"
	i=$[$i+1]
	shift
done
