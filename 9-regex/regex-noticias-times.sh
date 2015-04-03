#!/bin/bash
# Mostra últimas notícias de times
# brasileiros que estão no Uol Esporte

# Verificando junto ao usuário time
echo ""
echo "Digite o nome do time que deseja ver as últimas notícias."
echo "Exemplo: corinthians"
read time

# Apresentando saída com informações do time
clear
tput setaf 6
echo "* Últimas notícias do $time *"
echo ""
	# Bloco mais importante do código,
	# onde se limpa arquivo com notícias
	# baixado do Uol
	lynx -source http://esporte.uol.com.br/futebol/times/$time/noticias/ | \
	grep 'jpg" title=' | \
	sed "s/.*title='//" | \
	sed 's/ - .*//'
echo ""
echo "* Esperamos boas notícias do seu time $time *"
tput sgr0
