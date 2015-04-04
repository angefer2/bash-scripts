#!/bin/bash
# Descrição: instala apache com cgi
# Sitema: Debian

# Verificando se usuário tem permissão de instalação
if [[ "$UID" != "0" ]]; then
        echo "Você precisa possuir privilégios de super usuário!"
        echo "Tente novamente como root ou utilize sudo se possuir."
        exit 0
    else
    echo "Iniciando instalação de Apache com CGI..."
fi

# Realizando a instalação do Apache
apt-get install -y apache2


if [[ -e /etc/apache2/mods-available/cgi.load ]]; then
	echo "Arquivo referente ao Módulo CGI presente!"
	else
	echo "Ops! Arquivo referente ao Módulo CGI não está presente!"
fi

# Variável contendo conteúdo do 
# arquivo de módulo do CGI available
ArqModAv=$(cat /etc/apache2/mods-available/cgi.load)

if [[ "$ArqModAv" == "LoadModule cgi_module /usr/lib/apache2/modules/mod_cgi.so" ]]; then
	echo "O módulo está sendo carregado!"
	else
	echo "Ops! O módulo não está sendo carregado!"
fi

if [[ -e /etc/apache/mods-enabled/cgi.load ]]; then
	echo "Arquivo referente ao Módulo CGI em Enabled presente!"
	else
	echo "Ops! Arquivo referente ao Módulo CGI Enabled não está presente!"
fi

# Variável contendo conteúdo do 
# arquivo de módulo do CGI enabled
ArqModEn=$(cat /etc/apache2/mods-enabled/cgi.load)

if [[ "$ArqModEn" == "LoadModule cgi_module /usr/lib/apache2/modules/mod_cgi.so" ]]; then
	echo "O módulo está habilitado!"
	else 
	echo "Ops! O módulo não está habilitado!"
fi
