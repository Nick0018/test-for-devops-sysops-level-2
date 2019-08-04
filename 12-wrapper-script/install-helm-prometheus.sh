#! /bin/bash
sudo -i
cd /opt/kubernetes/5-helm
./get_helm.sh
exit

#Create the Tiller Service Account
kubectl apply -f /opt/kubernetes/5-helm/service-account.yaml

#create the service account role binding
kubectl apply -f /opt/kubernetes/5-helm/role-binding.yaml

#Deploy Tiller
helm init --service-account tiller --wait

# Create Monitoring namespace

kubectl apply -f /opt/kubernetes/7-monitoring-namespace/monitoring-namespace.yaml
helm install stable/prometheus -f  /opt/kubernetes/8-prometheus/values.yaml --namespace monitoring --name prometheus

#Create configmap for Grafana
kubectl apply -f /opt/kubernetes/9-grafana/config.yaml
helm install stable/grafana -f /opt/kubernetes/9-grafana/values.yaml --namespace monitoring --name grafana

