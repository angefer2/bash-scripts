#!/bin/bash

TITULO="MiniEditor"
SUBTITULO="Editor de texto minimalista"

ESCOLHA=$(dialog --stdout \
	--title "$TITULO" --backtitle "$SUBTITULO" \
	--menu "Escolha uma das opções:" 0 0 0 \
		Novo "Cria um novo arquivo" \
		Abre "Abre um arquivo existente" \
		Sair "Sai do $TITULO")

case $ESCOLHA in

	Novo) NOVO=$(dialog --stdout \
	--inputbox "Digite o caminho completo e novo do novo arquivo que deseja criar:" 0 0)

	if [[ -f $NOVO ]]; then

		dialog --msgbox "Ops! Este arquivo já existe" 0 0
	
	fi

	touch  $NOVO;
	
	TEXTO=$(dialog --stdout \
	--title "$TITULO" --backtitle "$SUBTITULO" \
	--editbox $NOVO 0 0);
	
	echo "$TEXTO" > $NOVO

	;;	

esac
