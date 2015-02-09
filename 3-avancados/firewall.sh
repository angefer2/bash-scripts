#!/bin/bash
# Nome: firewall.sh
# Descrição: script simples de firewall
# Autor: Gustavo S. de Lima
# Email: gustavo@logicus.com.br

# Instruções no Debian
# chmod 755 /etc/init.d/firewall.sh
# update-rc.d defaults firewall.sh


IPTABLES="/sbin/iptables"

IFACE_LO="lo"
IP_IFACE_LO="127.0.0.1"

IFACE_EXT=""
IP_IFACE_EXT=""
IP_REDE_EXT=""
IP_BROADCAST_EXT=""
MASC_REDE_EXT=""

IFACE_INT=""
IP_IFACE_INT=""
IP_REDE_INT=""
IP_BROADCAST_INT=""
MASC_REDE_INT=""

case "$1" in

	start)
	echo "Iniciando Firewall..."
	$IPTABLES -F
	$IPTABLES -F -t nat
	$IPTABLES -F -t mangle
	$IPTABLES -X

	# Políticas padrão
	$IPTABLES -P INPUT DROP
	$IPTABLES -P FORWARD DROP
	$IPTABLES -P OUTPUT DROP
	;;

	stop)
	echo "Parando Firewall..."
	$IPTABLES -F
	$IPTABLES -F -t nat
	$IPTABLES -F -t mangle
	;;

	restart)
	$0 stop
	$0 start
	;;

	status)
	$IPTABLES -L
	$IPTABLES -L -t nat
	$IPTABLES -L -t mangle
	;;

	*)
	echo "Use $0 {start|stop|restart|status}"
	;;

esac

exit 0
