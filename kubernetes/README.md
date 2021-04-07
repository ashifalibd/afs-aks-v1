Kubernetes Resources

# Kubernetes resources

In this folder you will find the basic resources to deploy [an application that displays a message, the name of the pod and details of the node it's deployed to.](https://github.com/paulbouwer/hello-kubernetes)

You can deploy the application in your cluster with:

```
Run Full Script of 

kubectl create namespace mytask

```
kubectl apply -f deployment.yml --namespace mytask
kubectl apply -f service.yml --namespace mytask
kubectl apply -f ingress-controller.yml 
kubectl describe ingress --namespace mytask

```
