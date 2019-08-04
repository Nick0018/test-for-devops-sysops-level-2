#! /bin/bash
# Create a development namespace
kuberctl create -f /opt/kubernetes/3-development-namespace

#Apply the Redis Master Deployment from the redis-master-deployment.yaml file
kubectl apply -f /opt/kubernetes/4-guest-book/redis-master-deployment.yaml

#Apply the Redis Master Service from the following redis-master-service.yaml file
kubectl apply -f /opt/kubernetes/4-guest-book/redis-master-service.yaml

#Apply the Redis Slave Deployment from the redis-slave-deployment.yaml file
kubectl apply -f /opt/kubernetes/4-guest-book/redis-slave-deployment.yaml

# Apply the Redis Slave Service from the following redis-slave-service.yaml file
kubectl apply -f /opt/kubernetes/4-guest-book/redis-slave-service.yaml

#Apply the frontend Deployment from the frontend-deployment.yaml file
kubectl apply -f /opt/kubernetes/4-guest-book/frontend-deployment.yaml

#Apply the frontend Service from the frontend-service.yaml file
kubectl apply -f /opt/kubernetes/4-guest-book/frontend-deployment.yaml/frontend-service.yaml
