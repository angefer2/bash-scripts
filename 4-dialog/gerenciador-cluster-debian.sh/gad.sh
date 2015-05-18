#!/bin/bash

NOME="GAD Gerenciador de Alta Disponibilidade"
VERSAO="0.1"

MENU=$(dialog --stdout \
	--backtitle "$NOME | Versão $VERSAO" \
	--title "Painel de Cluster" \
		--menu "Escolha uma das opções:" 0 0 0 \
		drbd "Gerenciar DRBD" \
		ocfs2 "Gerenciar OCFS2" \
		pacemaker "Gerenciar Pacemaker" \
		corosync "Gerenciar Corosync" \
		balanceamento "Gerenciar LVS" \
		monit "Gerenciar monitoramento com Monit" \
		xen "Gerenciar virtualização com Xen" \
		kvm "Gerenciar virtualização com Kvm")
