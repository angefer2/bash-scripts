#!/bin/bash

echo "Digite o nome do hostname da máquina:"
read resposta

# Usando o operador == para testar igualdade
if [ $resposta == $HOSTNAME ]
then
	echo correto!
else
	echo errado!
fi
