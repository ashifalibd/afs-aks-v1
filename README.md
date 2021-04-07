Provisioning Kubernetes clusters on Azure with Terraform and AKS

# Learn Terraform - Provision AKS Cluster

This repo is a companion repo to the [Provision an AKS Cluster learn guide](https://learn.hashicorp.com/terraform/kubernetes/provision-aks-cluster), containing Terraform configuration files to provision an AKS cluster on Azure.# afs-v1-aks


Steps to run:

1) Make sure terraform, kubectl and helm and Azure CLI (az) is installed
2) Make sure to login with your azure account in the Azure CLI (az)
3) In the repository root directory run the command ```terraform init``` ```terraform plan```and then ```terraform apply``` to create the k8s cluster on azure
4) Go to kubernetes directory and run the commands specified in the ```ingress.ps1``` file.

The deployed webapp can be found here: 20.54.47.205