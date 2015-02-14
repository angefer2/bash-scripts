#!/bin/bash
# Auxilia na instalação do Skype
# no Debian 64 bits

# Adicionando arquitetura i386
dpkg --add-architecture i386

# Atualizando lista de repositórios
apt-get update

# Se dirigindo para o diretório do root
cd ~

# Baixando o Skype
wget -O skype-install.deb http://www.skype.com/go/getskype-linux-deb

# Instalando o pacote do Skyé
dpkg -i skype-install.deb

# Resolvendo dependências
apt-get -f install

# Apagando lixo
rm skype-install.deb

echo "Concluído"
