#! /bin/bash
# Create a namespace logging
kubectl create -f /opt/kubernetes/10-EFK/kube-logging.yaml

#create a headless service of eleasticsearch
kubectl create -f /opt/kubernetes/10-EFK/elasticsearch-svc.yaml

#Create a SC and 3 PVs.
kubectl create -f /opt/kubernetes/10-EFK/sc.yaml
kubectl create -f /opt/kubernetes/10-EFK/pv.yaml
kubectl create -f /opt/kubernetes/10-EFK/pv-1.yaml
kubectl create -f /opt/kubernetes/10-EFK/pv-2.yaml

#Create a Statefulset of elasticsearch
kubectl create -f /opt/kubernetes/10-EFK/elasticsearch-statefulset.yaml

#Create Kibana
kubectl create -f /opt/kubernetes/10-EFK/kibana.yaml 

#Deploy the fluented.
kubectl create -f /opt/kubernetes/10-EFK/fluentd-daemonset.yaml
