create 4 VMs in GCE. 
1 kubernetes master node
Private IP    	Public IP 
10.128.15.192   35.224.77.7 

2 kubernetes node
Private IP    	Public IP 
node1
10.128.15.193	35.239.52.250   
10.128.15.194	35.222.93.73 

1 nfs server(500Gi)
Private IP    	Public IP 
10.128.15.194 	35.222.93.73  

Add firewall rule to allow the related port can be accessed.

Configuration NFS.
1. On nfs server, execute the following command
$ sudo yum install nfs-utils
$ sudo systemctl enable rpcbind
$ sudo systemctl enable nfs
2. Start the NFS
$ sudo systemctl start rpcbind
$ sudo systemctl start nfs
3. Configure the share directory.
$ sudo mkdir /data
$ sudo chmod 755 /data
$ sudo vi /etc/exports
Add the line as below
/data/     192.168.0.0/24(rw,sync,no_root_squash,no_all_squash)
4. Restart the nfs service.
$ sudo systemctl restart nfs

5. On master node and 2 worker node, excute the following command.
$ sudo yum install nfs-utils
$ sudo systemctl enable rpcbind
$ sudo systemctl start rpcbind


Step1 Deploy the kubernetes cluster.
./kubernetes-cluser.sh in master node and 2 worker nodes.

Step2 On master node.
kubeadm init

Step2 On worker node.
kubeadm join 10.128.0.47:6443 --token 9mhqth.eog5c866ws386hvq \
    --discovery-token-ca-cert-hash sha256:1dccb0092292e879874f8f3936a833f59f00051460a85ecfe95c8474dc27f68b
Step 3 On master node.
kubectl apply -f https://docs.projectcalico.org/v3.8/manifests/calico.yaml

Step 4 Execute the  deploy-guest-book.sh on Master node, deploy the guest-book application with development namespace.
./deploy-guest-book.sh

Step 5 Execute the script install-helm-prometheus.sh on master node, deploy the prometheus and grafana with monitoring namespace.

Step 6 Execute the script deploy-efk.sh on master node, deploy the efk with logging namespace.

Step 7 Demonstrate Blue/Green Deployment, execute the script blue-green-deployment.sh on master node.

Step 8 Demonstrate Canary Deployment.
a. On master node and 2 worker nodes, create directory /opt/kubernetes/11-bg-canary-deployment/canary-deployment, actually master node has above directory, no need to recreate it, we just create it on the 2 worker nodes. then excute the script app-1.sh on master node and 2 worker node.
b. Execute the script canary-deployment-phase1.sh on master node.
c. On master node and 2 worker nodes, execute the script app-2.sh.
d. Execute the script canary-deployment-phase2.sh on master node.
e. Verify the app.
 $ for i in `seq 1 20`; do curl http://$SERVICE_IP/version; sleep 1;  done
f. Execute the following command on master node.
 kubectl --namespace=production set image deployment/kubeapp-production kubeapp=gcr.io/app:2.0
g. Delete the canary deployment.
kubectl --namespace=production delete deployment/kubeapp-canary


