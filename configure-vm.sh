#!/bin/bash

#Diretorio utilizado pelo cluster agent
sudo mkdir /var/temp

sudo chmod 777 -R /var/temp


# Atualizar repositórios
sudo apt update

# Instalar pacotes pré-requisitos
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common

# Adicionar chave GPG oficial do Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Adicionar repositório estável do Docker
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu focal stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Atualizar repositórios novamente
sudo apt update

# Instalar Docker Engine
sudo apt install -y docker-ce docker-ce-cli containerd.io

# Adicionar usuário atual ao grupo "docker" para executar comandos Docker sem sudo
sudo usermod -aG docker $USER

# Habilitar inicialização automática do Docker no boot
sudo systemctl enable docker

# Instalar o comando docker-compose
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Verificar a versão do Docker instalada
docker --version

# Verificar a versão do docker-compose instalado
docker-compose --version

sudo chmod 777 /var/run/docker.sock

# Mostrar informações do Docker
docker info

# Informar ao usuário que a instalação foi concluída
echo "Docker foi instalado e configurado com sucesso!"

# Iniciar cluster Swarm
docker swarm init