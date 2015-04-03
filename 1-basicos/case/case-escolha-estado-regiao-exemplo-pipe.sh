#!/bin/bash
# Script que demonstra usa do 
# pipe no case

# Mostrando menu para o usuário
echo "Escolha um estado:"
echo "1. Rio Grande do Sul"
echo "2. Santa Catarina"
echo "3. Paraná"
echo "4. São Paulo"
echo "5. Rio de Janeiro"
echo "6. Minas Gerais"
echo "7. Bahia"
echo "8. Sergipe"
echo "9. Maranhão"
echo "10. Ceará"

read estado

case $estado in

	1 | 2 | 3) echo "Você escolheu um Estado da Região SUL"
	;;

	4 | 5 | 6) echo "Você escolheu um Estado da Região SUDESTE"
	;;

	# Usando três vezes o pipe
	7 | 8 | 9 | 10) echo "Você escolheu um Estado da Região NORDESTE"
	;;

	*) echo "Você não digitou uma opção válida"
	;;

esac
