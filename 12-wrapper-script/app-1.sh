#! /bin/bash
export app_version=1.0
cd /opt/kubernetes/11-bg-canary-deployment/canary-deployment
sudo docker build --build-arg version=$app_version -t gcr.io/app:$app_version .

