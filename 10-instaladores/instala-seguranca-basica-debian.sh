#!/bin/bash
# Descrição: ações para segurança mínima
# Sistema: Debian

# Verificando se usuário tem permissão de instalação
if [[ "$UID" != "0" ]]; then
	echo "Você precisa possuir privilégios de super usuário!"
	echo "Tente novamente como root ou utilize sudo se possuir."
        exit 0
    else
    echo "Iniciando instalação de programas úteis para segurança..."
    sleep 2
fi

# Usando o for para listar os 
# programas a serem instalados
for programa in clamav denyhosts iptables lynis portsentry tripwire

do
	echo "Instalando $programa ..."
	apt-get install -y $programa
done

echo "Script concluído!"
