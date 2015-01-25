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

	Novo) touch  ~/NovoArquivo.tmp;
	TEXTO=$(dialog --stdout \
	--title "$TITULO" --backtitle "$SUBTITULO" \
	--editbox ~/NovoArquivo.tmp 0 0);
	
	echo "$TEXTO" > ~/NovoArquivo.tmp

	;;	

esac
