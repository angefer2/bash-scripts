#!/bin/bash
# Imprime tabela de salários segundo Info Exame

echo ""
tput setaf 4
echo "*** Tabela Salarial em TI Segundo a Info Exame ***"
echo ""
tput sgr0

# Baixando página com salários e limpando saída
lynx -source http://info.abril.com.br/carreira/salarios/ | \
	egrep -A 3 'class="curso' | \
	grep -v '^--' | \
	sed 's/.*curso">//' | \
	sed 's/<\/td>//' | \
	sed 's/.*<td>//' | \
	sed 's/    / /' | \
	sed 's/&eacute;/e/' | \
	sed 's/&ccedil/cao/' | \
	sed 's/;&otilde;es&nbsp;//' | \
	sed 's/&nbsp;//' | \
	sed 's/;&otilde;es//' | \
	sed 's/;a//' | \
	sed 's/;&atilde;o//' | \
	sed 's/&nbsp;&nbsp;//' | \
	grep -v '^ ' | \
	sed 's/&nbsp;//' | \
	sed 's/&ccedil/cao/' | \
	sed 's/&oacute;cios/ocios/' | \
	sed 's/&iacute;der/ider/' | \
	sed -r 's/^([a-zA-Z].*)/\n\1/g'
