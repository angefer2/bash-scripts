#!/bin/bash
# O objetivo deste script é demonstrar o uso do pipe no case

echo "Digite seu dia da semana preferido:"
echo "Exemplo: segunda, terça, quarta, quinta, sexta, sábado ou domingo"
read dia

case $dia in

	# Observe a atuação do pipe
	segunda|terça) echo "você prefere o início da semana"
	;;
	
	quarta|quinta) echo "você prefere o meio da semana"
	;;

	# Você pode usar mais de uma vez o pipe
	sexta|sábado|domingo) echo "você prefere o fim da semana"
	;;

	*) echo "não reconhecemos esse dia"
	;;

esac

# FIM
