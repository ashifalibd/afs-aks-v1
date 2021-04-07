kubectl create namespace mytask

helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo update
helm install nginx-ingress ingress-nginx/ingress-nginx `
    --namespace mytask `
    --set controller.replicaCount=2 `
    --set controller.nodeSelector."beta\.kubernetes\.io/os"=linux `
    --set defaultBackend.nodeSelector."beta\.kubernetes\.io/os"=linux `
    --set controller.admissionWebhooks.patch.nodeSelector."beta\.kubernetes\.io/os"=linux

# kubectl --namespace mytask get services -o wide -w nginx-ingress-ingress-nginx-controller

kubectl apply -f deployment.yml --namespace mytask
kubectl apply -f service.yml --namespace mytask
kubectl apply -f ingress-controller.yml 

kubectl describe ingress --namespace mytask