#!/bin/bash

# Função voltar
FuncaoVoltar () {
	tput setaf 5
	echo "Pressione ENTER para voltar"   
	tput sgr0
	read voltar
}

# Menu com While
while true 
do
	clear
	echo ""
	echo "* Digite o número da opção e tecle ENTER *"
	echo ""
	echo "1 - Exibir status da utilização das partições do sistem; (df- h)"
	echo "2 - Exibir relação de usuário logados; (who)" 
	echo "3 - Exibir data/hora; (date)" 
	echo "4 - Sair."
	echo -ne "\nSua opção: "
	read opcao

	# Tratando opção do usuário com Case
	case $opcao in 

		# Caso a opção seja 1
		1) while true; do
			clear
			df -h
			FuncaoVoltar

				while [ -n "$voltar" ]; do
					clear
					df -h
					FuncaoVoltar
				done
			
			if [ -z "$voltar" ]; then
				break
			fi
		done
		;;

		# Caso a opção seja 2
		2) while true; do
			clear
			who -Hum
			FuncaoVoltar
				while [ -n "$voltar" ]; do
					clear
					who -Hum
					FuncaoVoltar
				done
			if [ -z "$voltar" ]; then
				break
			fi
		done
		;;

		# Caso a opção seja 3
		3) while true; do
			clear
			echo "Data       Horário"
			date "+%d/%m/%y - %H:%M:%S"
			FuncaoVoltar
				while [ -n "$voltar" ]; do
					clear
					echo ""
					echo "Data       Horário"
					date "+%d/%m/%y - %H:%M:%S"
					FuncaoVoltar
				done
			if [ -z "$voltar" ]; then
				break
			fi
		done
		;;

		# Caso a opção seja 4
		4) clear
		echo "Finalizando Programa"
		sleep 1
		clear
		break 
		;;

		*) echo ""
		echo "Opção Inválida"
		sleep 1	
		echo ""
		;;
	esac
done

# FIM
