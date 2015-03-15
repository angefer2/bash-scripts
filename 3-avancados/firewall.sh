#!/bin/bash
# Nome: firewall.sh
# Resumo: Shell Script simples de Firewall
# Autor: Gustavo S. de Lima
# Email: gustavo@logicus.com.br
# Descrição: O objetivo deste script é servir no aprendizado
# da programação Shell Script

# Instruções no Debian
# Para dar permissão ao script
# chmod 755 /etc/init.d/firewall.sh
# Para o firewall 
# update-rc.d defaults firewall.sh

# Levantando módulos
modprobe ip_tables
modprobe iptable_nat
modprobe ip_conntrack
modprobe ip_conntrack_ftp
modprobe ip_nat_ftp
modprobe ipt_LOG
modprobe ipt_REJECT
modprobe ipt_MASQUERADE
modprobe ipt_state
modprobe ipt_multiport
modprobe iptable_mangle
modprobe ipt_tos
modprobe ipt_limit
modprobe ipt_mark
modprobe ipt_MARK

case $1 in

	start)
	
	# Mensagem de inicialização
	echo "Script de Firewal"
	echo "Criado por Gustavo Soares de Lima"
	echo "Email: gustavo@logicus.com.br"
	echo "Iniciando Firewall..."

	# Iniciando política padrão
	iptables -P INPUT DROP
	iptables -P OUTPUT ACCEPT
	iptables -P FORWARD DROP

	# Habilitando tráfego interno
	iptables -I INPUT -i lo -j ACCEPT
	iptables -I OUTPUT -o lo -j ACCEPT

	iptables -I INPUT -m state --state ESTABLISHED -j ACCEPT
	iptables -I OUTPUT -m state --state RELATED -j ACCEPT

	;;

	stop)

	echo "Parando Firewall..."

	;;

	restart)

	$0 stop
	$0 start

	;;

	*)
	
	echo "Digite $0 {start|stop|restart|status}"

	;;
esac
