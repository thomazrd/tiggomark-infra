#!/bin/bash

# Verifica se foram passados argumentos suficientes
if [ $# -ne 2 ]; then
    echo "Erro: É necessário passar dois argumentos. O primeiro é o nome do volume Docker a ser backupado e o segundo é o caminho completo do arquivo tar.gz a ser gerado."
    exit 1
fi

nome_volume="$1"
arquivo_backup="$2"
data_atual=$(date +%Y-%m-%d_%H-%M-%S)

# Verifica se o volume existe
if ! docker volume inspect $nome_volume > /dev/null 2>&1; then
    echo "Erro: O volume Docker especificado não existe."
    exit 1
fi

# Cria o diretório temporário para armazenar o arquivo de backup
dir_tmp=$(mktemp -d)

# Cria o arquivo tar.gz do volume
docker run --rm -v $nome_volume:/data -v $dir_tmp:/backup alpine:latest tar -czf /backup/backup-$data_atual.tar.gz -C /data .

# Move o arquivo de backup para o caminho especificado
mv $dir_tmp/backup-$data_atual.tar.gz $arquivo_backup

# Remove o diretório temporário
rm -rf $dir_tmp

echo "Backup do volume $nome_volume salvo em $arquivo_backup."
