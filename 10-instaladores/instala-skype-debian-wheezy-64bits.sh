#!/bin/bash
# Auxilia na instalação do Skype
# no Debian 64 bits
# OBS: feito para versão Wheezy mas funciona 
# também na versão Jessie

# Se não tiver privilégios de root
# sai imediatamente
if [[ $UID != 0 ]]; then
    echo "Para instalar o Skype você precisa possuir privilégios de super usuário!"
    echo "Tente novamente como root ou use sudo se possuir."
    exit 0
    else
    echo "Iniciando instalação do Skype..."
    sleep 2
fi

# Adicionando arquitetura i386
echo "Adicionando arquitetura i386, necessária para instalação do Skype..."
dpkg --add-architecture i386

# Atualizando lista de repositórios
echo "Atualizando lista de repositórios..."
apt-get update

# Se dirigindo para o diretório do root
echo "Mudando para o diretório do root onde será baixado o Skype..."
cd ~

# Baixando o Skype
echo "Agora vamos baixar o pacote do Skype..."
wget -O skype-install.deb http://www.skype.com/go/getskype-linux-deb

# Instalando o pacote do Skyé
echo "Usaremos agora o dpkg para instalar o pacote..."
dpkg -i skype-install.deb

# Resolvendo dependências
echo "Agora vamos resolver as dependências..."
apt-get -f install

# Apagando lixo
echo "Apagando o pacote baixado para não ficar lixo..."
rm skype-install.deb

echo "Concluído!"
