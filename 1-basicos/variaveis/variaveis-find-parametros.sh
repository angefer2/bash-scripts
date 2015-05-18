#!/bin/bash

echo "Buscador de arquivo"
echo -n "Digite o caminho completo do diretório onde buscar: "
read caminho
echo -n "Digite o nome do arquivo a ser buscado: "
read arquivo
echo "Resultado:"
find $caminho -name $arquivo
