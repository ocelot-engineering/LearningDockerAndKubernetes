# Run in powershell

# Imperative approach
minikube start # start cluster
minikube status # confirm cluster is up and running

kubectl create deployment first-app --image=<remote image name>
kubectl delete deployment first-app
kubectl get deployments # get deployments info
kubectl get pods # get pod info

minikube dashboard # see daashboard in browser

kubectl expose deployment first-app --type=LoadBalancer --port=8080
kubectl get services
minikube service first-app # returns a url for a service in the local cluster (bascially maps a port to an IP)

kubectl scale deployment/first-app --replicas=3 # creates 3 pods, load balancer handles routing to pods

kubectl set image deployment/first-app kub-first-app=<remote image name> # update image
kubectl rollout status deployment/first-app # see status of image update and reployment
kubectl rollout undo deployment/first-app # undo latest deployment
kubectl rollout undo deployment/first-app --to-revision=1 # rollback to a specific revision

kubectl delete service first-app
kubectl delete deployment first-app

# Declarative approach
kubectl apply -f=deployment.yaml