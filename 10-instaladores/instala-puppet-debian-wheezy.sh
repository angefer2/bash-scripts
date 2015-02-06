#!/bin/bash
# Auxilia na instalação do Puppet
# no Debian Wheezy a partir do
# repositório da Puppet Labs

# Verificando se usuário tem permissão de instalação
if [[ "$UID" != "0" ]]; then
	echo "Você precisa ser o root para instalar o Puppet"
	exit 0
fi

# Dirigindo-se para o diretório do root
cd ~

# Baixando o release da Puppet Labs, com ele
# você terá acesso a pacotes mais atuais do Puppet
wget http://apt.puppetlabs.com/puppetlabs-release-wheezy.deb

# Instalando o release
dpkg -i puppetlabs-release-wheezy.deb

# Atualizando repositório
apt-get update

# Instalando o Puppet
apt-get install puppet -y

# Limpando lixo da instalação
rm puppetlabs*

echo "Concluído"
