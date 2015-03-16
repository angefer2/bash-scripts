#!/bin/bash
# Dialog-game
# Autor: Gustavo Soares de Lima
# Email: ghtp25@gmail.com

Titulo="Aceita o desafio?"
Subtitulo="Dialog Game, acerte o alvo para ganhar!"

while true
do
	linha=$(seq 1 28 | sort -R | tail -1)
	coluna=$(seq 1 115 | sort -R | tail -1)
	dialog --timeout 1 \
		--begin $linha $coluna \
		--title "$Titulo" \
		--backtitle "$Subtitulo" \
		--msgbox "Duvido que você acerte! Não vale usar o ENTER..." 0 0

	if [[ "$?" == "0" ]]; then
		break
	fi
done

dialog --title "Você acertou!" \
	--backtitle "Obrigado por brincar conosco!" \
	--infobox "Parabés, você ganhou" 0 0

# Fim
