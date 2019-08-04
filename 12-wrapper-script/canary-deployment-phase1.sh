#! /bin/bash
#Create a namespace production
kubectl create namespace production

#Create the application with namespace production
kubectl --namespace=production apply -f /opt/kubernetes/11-bg-canary-deployment/canary-deployment/k8s/app-production.yml

#Create a service for application 1.0
kubectl --namespace=production apply -f /opt/kubernetes/11-bg-canary-deployment/canary-deployment/k8s/app-lb.yml 

