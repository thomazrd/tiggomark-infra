#!/bin/bash

# Verifica se foram passados argumentos suficientes
if [ $# -ne 2 ]; then
    echo "Erro: É necessário passar dois argumentos. O primeiro é o caminho para o arquivo a ser copiado e o segundo é o nome do volume Docker para onde copiar."
    exit 1
fi

caminho_arquivo="$1"
nome_volume="$2"

# Cria o volume Docker, se ainda não existir
docker volume inspect $nome_volume > /dev/null 2>&1 || docker volume create $nome_volume

# Executa o contêiner com o volume Docker montado
id_contenedor=$(docker run -d -v $nome_volume:/data alpine:latest)

# Copia o arquivo para dentro do contêiner
docker cp $caminho_arquivo/. $id_contenedor:/data

# Mostra a lista de arquivos copiados para o volume
docker run --rm -v "$nome_volume":/data alpine:latest ls  /data


# Remove o contêiner após a cópia dos arquivos
docker rm -f $id_contenedor > /dev/null 2>&1
