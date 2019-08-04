#! /bin/bash
#Release the canary
kubectl --namespace=production apply -f /opt/kubernetes/11-bg-canary-deployment/canary-deployment/k8s/app-canary.yml
