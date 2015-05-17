#!/bin/bash
# Descrição: testa se caminho é diretório

echo "Digite um caminho para testar se é diretório:"
read caminho

# Perceba o uso do test articulado com if
if test -d $caminho; then
	echo "$caminho é um diretório"
else
	echo "$caminho não é um diretório"
fi

# FIM
