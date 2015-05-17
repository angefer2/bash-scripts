#!/bin/bash
# Descrição: mostra várias possibilidades de imagens

for IMAGEM in /usr/share/icons/gnome/*/*/*.png
do
	notify-send --expire-time=5 -i $IMAGEM "Exemplo" "Veja como o Notify pode ser usado"
done
