#!/bin/bash
# Auxilia na instalação do Puppet
# no Debian Wheezy a partir do
# repositório da Puppet Labs

# Verificando se usuário tem permissão de instalação
if [[ "$UID" != "0" ]]; then
	echo "Você precisa possuir privilégios de super usuário para instalar o Puppet!"
    echo "Tente novamente como root ou utilize sudo se possuir."
	exit 0
    else
    echo "Iniciando instalação do Puppet..."
    sleep 2
fi

# Dirigindo-se para o diretório do root
echo "Mudando para o diretório do usuário para baixar o release do Puppet..."
cd ~

# Baixando o release da Puppet Labs, com ele
# você terá acesso a pacotes mais atuais do Puppet
echo "Baixando o release da Puppet Labs para ter acesso as últimas versões..."
wget http://apt.puppetlabs.com/puppetlabs-release-wheezy.deb

# Instalando o release
echo "Usando o dpkg para instalar o release..."
dpkg -i puppetlabs-release-wheezy.deb

# Atualizando repositório
echo "Atualizando a lista de repositórios..."
apt-get update

# Instalando o Puppet
echo "Instalando o Puppet com suas dependências..."
apt-get install puppet -y

# Limpando lixo da instalação
echo "Apagando o pacote de release para não deixar lixo..."
rm puppetlabs*

echo "Concluído"