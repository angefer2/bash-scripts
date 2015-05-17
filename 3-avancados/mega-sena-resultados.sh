#!/bin/bash
# Autor: Gustavo S. de Lima
# Email: ghtp25@gmail.com
# Descrição: Gera lista dos números que já caíram na megasena de forma ordenada

# Bloco de funções

# Função de ajuda
funcao_ajuda () {
Ajuda="Opções:

	--ajuda			Mostra esta ajuda e sai
	--alimenta		Alimenta a base de dados
	--limpa-base		Limpa base de dados presente
	--numeros-sorteados	Mostra de lista de números e quantas vezes sorteados
	--sorteio-com-datas	Mostra datas dos sorteios com números sorteados
	--sorteio-por-data	Mostra o sorteio de uma data específica
	--sorteio-por-mes	Mostra o sorteio por mês
	--jogo-aleatorio	Gera uma sequência aleatória para palpite
"
echo "$Ajuda"
}

# Função que alimenta base de dados
funcao_alimenta_base () {
	# Baixando arquivo com resultados da caixa e descompactando
	echo "Iremos baixar os sorteios do site da caixa, por favor aguarde..."
	wget http://www1.caixa.gov.br/loterias/_arquivos/loterias/D_megase.zip
	unzip D_megase.zip
	echo "Operação concluída!"
}

# Função de limpeza base de dados
funcao_limpa_base () {
	rm D_MEGA.HTM D_megase.zip T2.GIF
	echo "Base zerada! Para ver novamente resultados deverá alimentar a base!"
}

# Função que lista sorteios
funcao_lista_quantidade_sorteio () {
	cat D_MEGA.HTM | grep -E -a -A 6 '[0-9]{2}/[0-9]{2}/[0-9]{4}' | \
	sed 's/<td>// ; s/<\/td>// ; s/--//' | \
	grep -E '[0-9]{2}' | grep -vE '[0-9]{2}\/[0-9]{2}\/[0-9]{4}' | \
	sed 's/.*>//' | sort | uniq -c | sort
}

# Função que mostra sorteio com datas
funcao_sorteio_com_datas () {
	cat D_MEGA.HTM | grep -E -a -A 6 '[0-9]{2}/[0-9]{2}/[0-9]{4}' | \
	sed 's/<td>// ; s/<\/td>// ; s/--//' | \
	grep -E '[0-9]{2}' | sed 's/.*>//'
}

# Função que mostra sorteio por data
funcao_sorteio_por_data () {
	echo "Digite a data do sorteio. Exemplo: 24/12/2014"
	read data

	echo "Os números são:"
	cat D_MEGA.HTM | grep -E -a -A 6 '[0-9]{2}/[0-9]{2}/[0-9]{4}' | \
	sed 's/<td>// ; s/<\/td>// ; s/--//' | \
	grep -E '[0-9]{2}' | sed 's/.*>//' | grep -A 6 $data
}

# Função que mostra sorteio por mês
funcao_sorteio_por_mes () {
	echo "Digite o mês por número decimal, exemplo 04 para abril"
	read mes

	cat D_MEGA.HTM | grep -E -a -A 6 '[0-9]{2}/[0-9]{2}/[0-9]{4}' | \
	sed 's/<td>// ; s/<\/td>// ; s/--//' | \
	grep -E '[0-9]{2}' | sed 's/.*>//' | \
	grep -E -A 6 '[0-9]{2}\/'$mes'\/[0-9]{4}'
}

funcao_jogo_aleatorio () {
	seq 60 | shuf | tail -6
}

# Caso o usuário não digite nada
# mostra a ajuda
if [[ "$#" == "0" ]]; then
	funcao_ajuda
fi

# Tratamento das opções
case $1 in

	--ajuda) funcao_ajuda
	;;
	
	--alimenta) funcao_alimenta_base
	;;
	
	--numeros-sorteados) funcao_lista_quantidade_sorteio
	;;
	
	--limpa-base) funcao_limpa_base
	;;
	
	--sorteio-com-datas) funcao_sorteio_com_datas
	;;
	
	--sorteio-por-data) funcao_sorteio_por_data
	;;
	
	--sorteio-por-mes) funcao_sorteio_por_mes
	;;

	--jogo-aleatorio) funcao_jogo_aleatorio
	;;

esac
