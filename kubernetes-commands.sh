# minikube
minikube start # start cluster
minikube start --driver=docker # default
minikube start --driver=virtualbox

minikube dashboard
minikube status

minikube service <servicename> # returns a url for a service in the local cluster (bascially maps a port to an IP)

# kubectl
kubectl help
kubectl get deployments
kubectl get pods
kubectl get services

kubectl apply -f config1.yaml
kubectl delete -f config1.yaml

kubectl scale deployment/first-app --replicas=3 # creates 3 pods, load balancer handles routing to pods

