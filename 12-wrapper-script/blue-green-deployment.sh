#! /bin/bash
#Deploy the blue application nginx 1.10
kubectl apply -f /opt/kubernetes/11-bg-canary-deployment/blue-green-deployment/kubernetes/blue.yaml

#Deploy a service for the deployment
kubectl apply -f /opt/kubernetes/11-bg-canary-deployment/blue-green-deployment/kubernetes/service.yaml

#Automate blue/green deployment with script.
cd /opt/kubernetes/11-bg-canary-deployment/blue-green-deployment/kubernetes
./opt/kubernetes/11-bg-canary-deployment/blue-green-deployment/bin/bg-deploy.sh nginx 1.11 green-deploy.yaml 
