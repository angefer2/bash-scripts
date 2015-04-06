#!/bin/bash
# Descrição: instala apache com cgi
# Sitema: Debian

# Limpando tela
clear

# Variável que determina número da cor usada no script
Cor="3"

# Funções que habilitam / desabilitam uso de cor
InicioCor () {
	tput setaf $Cor
}

FimCor () {
	tput sgr0
}


# Verificando se usuário tem permissão de instalação
if [[ "$UID" != "0" ]]; then
	InicioCor
        echo "Você precisa possuir privilégios de super usuário!"
        echo "Tente novamente como root ou utilize sudo se possuir."
	FimCor
        exit 0
else

	InicioCor
	echo "Iniciando instalação de Apache com CGI..."
	FimCor
fi

# Realizando a instalação do Apache
apt-get install -y apache2

# Verificando se apache.conf faz referência ao módulo
InicioCor
echo "Verificando se o apache.conf possui linha que referencia módulo cgi..."
FimCor
grep "LoadModule cgi_module modules/mod_cgi.so" /etc/apache2/apache2.conf
if [[ "$?" = "1" ]]; then
	InicioCor
	echo "O arquivo apache.conf não referencia módulo, lançaremos na última linha tal referência"
	echo "LoadModule cgi_module modules/mod_cgi.so" >> /etc/apache2/apache2.conf
	FimCor
else
	InicioCor
	echo "Teste de referência ok. Apache.conf possui linha relativa ao módulo!"
	FimCor
fi

# Habilitando módulo CGI
InicioCor
echo "Usaremos agora o a2enmod para habilitar o módulo:"
FimCor
a2enmod cgi


# Reestartando apache
InicioCor
echo "Iremos reestartar o serviço Apache:"
FimCor
service apache2 restart

if [[ -e /etc/apache2/mods-available/cgi.load ]]; then
	InicioCor
	echo "Arquivo referente ao Módulo CGI presente!"
	FimCor
else
	InicioCor
	echo "Ops! Arquivo referente ao Módulo CGI não está presente!"
	FimCor
fi

# Variável contendo conteúdo do 
# arquivo de módulo do CGI available
ArqModAv=$(cat /etc/apache2/mods-available/cgi.load)

if [[ "$ArqModAv" == "LoadModule cgi_module /usr/lib/apache2/modules/mod_cgi.so" ]]; then
	InicioCor
	echo "O módulo está sendo carregado!"
	FimCor
else
	InicioCor
	echo "Ops! O módulo não está sendo carregado!"
	FimCor
fi

if [[ -e /etc/apache/mods-enabled/cgi.load ]]; then
	InicioCor
	echo "Arquivo referente ao Módulo CGI em Enabled presente!"
	FimCor
else
	InicioCor
	echo "Ops! Arquivo referente ao Módulo CGI Enabled não está presente!"
	FimCor
fi

# Variável contendo conteúdo do 
# arquivo de módulo do CGI enabled
ArqModEn=$(cat /etc/apache2/mods-enabled/cgi.load)

if [[ "$ArqModEn" == "LoadModule cgi_module /usr/lib/apache2/modules/mod_cgi.so" ]]; then
	InicioCor
	echo "O módulo está habilitado!"
	FimCor
else 
	InicioCor
	echo "Ops! O módulo não está habilitado!"
	FimCor
fi
