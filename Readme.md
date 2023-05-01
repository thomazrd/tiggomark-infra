Para executar k8s
cd k8s
kubectl apply -f . 

Para um cluster específico

kubectl apply --context do-ams3-k8s-1-25-4-do-0-ams3-1678788205661 -f .

Deploy da stack docker 

docker stack deploy -c docker-swarm.yml cluster


Ex de como fazer restore dos dados (Usar com muito cuidado):
./restore_data.sh /home/tiggomark/Documents/volumes/db cluster_saas_connector_db_data_cl

./backup_data.sh tiggomark-cluster_projects_db_data_cl /home/tiggomark/Desktop/backup-meuvolume.tar.gz

Observe que é necessário colocar o profixo "cluster" por que o sawrm cria o volume automaticamente com esse nome


