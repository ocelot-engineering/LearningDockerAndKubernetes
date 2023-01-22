# volumes survive for the lifetime of the pod. If the pod is removed, then the 
#  volume will be deleted.

minikube status
# minikube start # default uses docker as driver, which has some issues sending requests to
# but virtualbox requires some extra configuration on windows.
minikube start
cd \\wsl$\Ubuntu
cd <project path>
kubectl get deployments
kubectl apply -f service.yaml -f deployment.yaml
kubectl get deployments
minikube service story-service