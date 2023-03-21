Para executar k8s
cd k8s
kubectl apply -f . 

Para um cluster específico

kubectl apply --context do-ams3-k8s-1-25-4-do-0-ams3-1678788205661 -f .

Deploy da stack docker 

docker stack deploy -c docker-swarm.yml tiggomark-cluster


kubectl port-forward service/saas-connector 8080:8080 &

kubectl port-forward service/projects 8081:80 &