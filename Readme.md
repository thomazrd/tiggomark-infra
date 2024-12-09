



Alterar permisao dos arquivo
chmod 777 configure-vm.sh



Deploy da stack docker 

docker stack deploy -c docker-swarm.yml cluster
docker stack deploy -c docker-swarm-cluster.yml cluster


Ex de como fazer restore dos dados (Usar com muito cuidado):
./restore_data.sh /home/tiggomark/Documents/volumes/db cluster_saas_connector_db_data_cl

Backup de um volume
./backup_data.sh tiggomark-cluster_projects_db_data_cl /home/tiggomark/Desktop/backup-meuvolume.tar.gz

Observe que é necessário colocar o profixo "cluster" por que o sawrm cria o volume automaticamente com esse nome




