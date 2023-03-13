Para executar k8s
cd k8s
kubectl apply -f . 



Deploy da stack docker 

docker stack deploy -c docker-swarm.yml tiggomark-cluster


kubectl port-forward service/saas-connector 8080:8080 &

kubectl port-forward service/projects 8081:80 &