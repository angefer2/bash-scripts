#!/bin/bash
# Instalador de openvpn
# Sistema: Debian
# Autor: Gustavo Soares de Lima

# Histórico de versões
# 0.1	-   Funções básicas como instalação, checagem de arquivos e liberação de porta, etc.

# Variáveis
VERSAO="Versão 0.1"
PROGRAMA="$0 $VERSAO"

# Início do script
clear
echo "*** Instalador de OpenVPN ***"
echo "Criado por Gustavo S. de Lima"
echo "Email: ghtp25@gmail.com"
echo "OBS: Funcional no Debian"
echo
echo "Realizando teste de túnel..."
test ! -c /dev/net/tun && echo openvpn "Requer-se suporte para túnel" || echo "Túnel é permitido"
echo "Deseja continuar? s/n"
read RESPOSTA
if [[ "$RESPOSTA" == "n" ]]; then
	echo "Você optou por sair! Obrigado por usar $PROGRAMA."
	exit 0
fi

# Resolvendo data e hora
echo "Para que o openvpn possa funcionar a contento é preciso ter hora e data corretamente configuradas. Deseja atualizar a data e hora conforme ntpdate? s/n"
read RESPOSTA
	if [[ "$RESPOSTA" == "s" ]]; then
	apt-get install ntpdate
	ntpdate ntp.ufpr.br
	hwclock -w
fi

# Realizando a instalação no Debian via apt
echo "Deseja instalar o pacote via apt-get do openvpn? Lembre-se que os repositórios deverão estar corretamente configurados! s/n"
read RESPOSTA
if [[ $RESPOSTA == "s" ]]; then
	apt-get update
	apt-get install openvpn -y
fi

# Verificando a existência do diretório openvpn em /etc
echo "Conferindo se o diretório /etc/openvpn foi criado..."
if [[ -e /etc/openvpn/ ]]; then
	echo "O diretório do openvpn em /etc existe!"
	else
	echo "Atenção! Ao procurar o diretório do openvpn em /etc o mesmo não foi encontrado!"
	echo "Deseja criar este diretório agora? s/n"
	read RESPOSTA
	if [[ "$RESPOSTA" == "s" ]]; then
		mkdir /etc/openvpn
	fi
fi

# Habilitando ip_forward no caso da máquina atuar como firewall
echo "Verificando se o ip_forward está habilitado..."
grep "net.ipv4.ip_forward=1" /etc/sysctl.conf
if [[ "$?" == "1" ]]; then
	echo "Pergunta: Deseja habilitar o ip_forward nesta máquina? s/n"
	read RESPOSTA
	if [[ "$RESPOSTA" == "s" ]]; then
		echo "net.ipv4.ip_forward=1" >> /etc/sysctl.conf
		sysctl -p
	fi
else
	echo "Ip Forward habilitado!"
fi

# No caso da máquina atuar como firewall habilitar a porta 1194
echo "Deseja liberar a porta de comunicação 1194 no modo INPUT neste computador através do iptables? Lembre-se que esta configuração é volátil! s/n"
read RESPOSTA
if [[ $RESPOSTA == "s" ]]; then
	iptables -A INPUT -p udp --dport 1194 -j ACCEPT
	echo "Em 2 segundos as regras atuais de iptables serão mostradas..."
	sleep 2
	iptables -L
fi

# Verificando existência de chaves easy-rsa
if [[ -e /usr/share/doc/openvpn/examples/easy-rsa/ ]]; then
	echo "Deseja copiar os arquivos de exemplo de easy-rsa para o diretório /etc/openvpn? s/n"
	read RESPOSTA
	if [[ "$RESPOSTA" == "s" ]]; then
		cp /usr/share/doc/openvpn/examples/easy-rsa/2.0/* -R /etc/openvpn/
	fi
fi

if [[ -e /etc/openvpn/var ]]; then
	# Abrindo o arquivo para o usuário editar
	echo "Deseja abrir o arquivo /etc/openvpn/vars para editá-lo? s/n"
	read RESPOSTA
	if [[ "$RESPOSTA" == "s" ]]; then
		nano /etc/openvpn/vars
	fi
fi


# Geração da chave e certificado digital
echo "Deseja gerar a chave e criar o certificado mestre da CA agora? s/n"
read RESPOSTA
if [[ "$RESPOSTA" == "s" ]]; then
	cd /etc/openvpn
	source vars
	./clean-all
	./build-ca
	./build-key-server servidor
fi

echo "Deseja gerar a(s) chave(s) privada(s) para os clientes? s/n"
read RESPOSTA
if [[ "$RESPOSTA" == "s" ]]; then
	echo "Para quantos clientes deverão ser criadas chaves? Digite apenas o número e tecle ENTER"
	read QUANTIDADE
fi
if [[ -n "$QUANTIDADE" ]]; then
	for CLIENTE in $(seq 1 $QUANTIDADE)
	do
		cd /etc/openvpn;
		tput setaf 6
		echo "Criando chave do cliente $CLIENTE"
		tput sgr0
		./build-key $CLIENTE
	done
fi

# Mudando os arquivos para o local correto
echo "Deseja mover os arquivos de /etc/openvpn/keys para /etc/openvpn? s/n"
read RESPOSTA
if [[ "$RESPOSTA" == "s" ]]; then
	cp /etc/openvpn/keys/* /etc/openvpn
fi


# Resolvendo arquivos de configuração
# Resolvendo configuração servidor
echo "Deseja copiar arquivo de configuração de exemplo do servidor para o diretório de configuração? s/n"
read RESPOSTA
if [[ "$RESPOSTA" == "s" ]]; then
	cd /usr/share/doc/openvpn/examples/sample-config-files/
	gunzip /usr/share/doc/openvpn/examples/sample-config-files/server.conf.gz
	cp /usr/share/doc/openvpn/examples/sample-config-files/server.conf /etc/openvpn/
fi

# Resolvendo configuração cliente
echo "Deseja copiar arquivo de configuração de exemplo do cliente para o diretório de configuração? s/n"
read RESPOSTA
if [[ "$RESPOSTA" == "s" ]]; then
	if [[ -e /usr/share/doc/openvpn/examples/sample-config-files/client.conf ]]; then
		cp /usr/share/doc/openvpn/examples/sample-config-files/client.conf /etc/openvpn/
	else
		echo "Arquivo cliente de configuração de exemplo inexistente!"
	fi
fi

# Restartando o serviço do openvpn
echo "Deseja realizar restart do service openvpn? s/n"
read RESPOSTA
if [[ "$RESPOSTA" == "s" ]]; then
	service openvpn stop
	service openvpn start
fi

# Comunicando ao usuário fim do programa
echo "Fim! Obrigado por usar o $PROGRAMA"
