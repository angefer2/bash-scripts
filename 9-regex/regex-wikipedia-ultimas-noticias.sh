#!/bin/bash

echo "Verificando página de últimas notícias da Wikipédia..."
wget http://pt.wikinews.org/wiki/Página_principal
echo "Mostrando últimas notícias em 2 segundos..."
sleep 2
echo ""

# Mudando cor da fonte para azul
tput setaf 4
echo " *** Últimas notícias da Wikipédia *** "
# Retornando cor original
tput sgr0

# Grepando apenas os títulos das notícias
cat Página_principal | \
grep -o ' title=".*\"' | \
grep -A 20 "Últimas notícias" | \
grep -oE "title=".*"" | \
grep -v "Predefinição" | \
sed 's/title="//' | \
sed 's/"//' 

# Novamente mudando a cor da fonte para azul
tput setaf 4
echo " *** Últimas notícias da Wikipédia *** "
# Retornando cor original
tput sgr0
echo ""

# Apagando lixo
rm Página_principal
