#!/bin/bash

(echo 50; sleep 2; echo 100) | \
	dialog --backtitle "Aguarde um minuto..." \
		--title "Instalando Linux" \
		--gauge 'Baixando pacote do repositório' 6 50 0
