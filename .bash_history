apt update && apt upgrade -y && apt dist-upgrade -y
apt install -y apt-transport-https ca-certificates curl software-properties-common gnupg2 net-tools
hostnamectl set-hostname $(curl -s http://169.254.169.254/latest/meta-data/local-hostname)
apt install -y docker.io
cat << EOF > /etc/docker/daemon.json
{
  "exec-opts": ["native.cgroupdriver=systemd"],
  "log-driver": "json-file",
  "log-opts": {
    "max-size": "100m"
  },
  "storage-driver": "overlay2"
}
EOF

systemctl stop docker
systemctl start docker
systemctl enable docker
cat <<EOF > /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
net.ipv4.ip_forward = 1
EOF

sysctl --system
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add
apt-add-repository "deb http://apt.kubernetes.io/ kubernetes-xenial main"
apt update
apt install kubelet="1.22.17-00" 
apt install kubeadm="1.22.17-00"
apt install kubectl="1.22.17-00"
cat << EOF > /etc/kubernetes/aws.yaml
---
apiVersion: kubeadm.k8s.io/v1beta3
kind: ClusterConfiguration
kubernetesVersion: v1.22.17
networking:
  serviceSubnet: "10.100.0.0/16"
  podSubnet: "10.244.0.0/16"
apiServer:
  extraArgs:
    cloud-provider: "aws"
controllerManager:
  extraArgs:
    cloud-provider: "aws"
EOF

kubeadm init --config /etc/kubernetes/aws.yaml
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
kubectl apply -f https://docs.projectcalico.org/manifests/calico-typha.yaml
kubectl get nodes
kubeadm token generate
kubeadm token list
kubeadm token create
kubeadm token create --print-join-command
kubeadm --print-join-command
kubeadm token generate --print-join-command
kubeadm token create --print-join-command
ls
kubectl get node
kubeadm token create --print-join-command
kubectl get node
cd /etc/kubernetes/
ls
cat aws.yaml 
cat kubelet.conf 
ls
cat admin.conf 
ls
cat controller-manager.conf 
cd
kubectl get node
l
ls
vi pod.yml 
rm -rf *
git init
ls
vi file1
ls
vi file1 
git add file1 
git commit -m "1st"
git remote add wali https://github.com/syedwaliuddin/role_tomcat_book.git
git remote -v
git status
git log
git push origin master
git push wali master
git show 
vi file1 
git status
git add file1 
git commit -m "2nd"
git log
git show 975276d6aa1
git revert 
git show  3f34faf7ff3277f
git show 975276d6aa178f
git show 975276d6aa178
git log
git log --oneline
git revert 3f34faf
git log --oneline
git show e582b1f
vi file1 
git add file1 
git commit -m "3rd"
git push wali master
git branch
git checkout -b new
vi file1 
git switch master
git merge new
git merge branch new
git branch merge new
git branch
git branch -d merge 
git branch
git switch
git switch new
git merge master
git push wali master
git fetch
git fetch master
git fetch 'https://github.com/syedwaliuddin/role_tomcat_book.git
git fetch https://github.com/syedwaliuddin/role_tomcat_book.git
git log
git show d1a31f89dd780250d7
git d1a31f89dd7802
git status
git commit -m "4th"
git add file1 
git status
git commit -m "4th"
git push wali master 
git pull https://github.com/syedwaliuddin/role_tomcat_book.git
git pull wali master
git pull origin master
git remote -v
git config --global user.name syed
git config --global user.email syed@gmail.com
git pull wali master
ls
vi file1 
git log
history 
kubectl get nodes
kubectl get pods
kubectl delete pods --all
kubectl get pods
ls
kubectl get pods
kubectl delete pod tomcat-hgwrp
kubectl get pods
kubectl delete pod tomcat-hgwrp -f
kubectl delete pod -f tomcat-hgwrp 
kubectl delete pods
kubectl delete -f pods --all 
kubectl delete pods --all 
kubectl get pods
cd /etc/kubernetes/
ls
vi controller-manager.conf 
vi manifests/
cd manifests/
ls
cat etcd.yaml 
cd
vi pod.yml
kubectl get pods --show-labels
kubectl scale pods replicas=1 -l app=tomcat
kubectl scale pods replica=1 -l app=tomcat
kubectl scale pods replicaset=1 -l app=tomcat
kubectl scale pods replicas=1 -l app=tomcat
kubectl delete pods --all
kubectl get rs
kubectl scale pods tomcat-replica replicas=1 -l app=tomcat
kubectl scale pods tomcat-replica replicas=1
kubectl scale pods tomcat-replica 
ls
vi pod.yml
kubectl create pod.yml 
kubectl create -f pod.yml 
vi pod.yml
kubectl create -f pod.yml 
vi pod.yml
kubectl apply -f pod.yml 
kubectl get pods -A
cd /etc/kubernetes/
ls
cd pki
ls
cat apiserver-kubelet-client.crt 
cd
vi pod.yml 
kubectl apply -f pod.yml 
vi pod.yml 
kubectl apply -f pod.yml 
vi pod.yml 
kubectl apply -f pod.yml 
kubectl get pods
kubectl get pods --show-labels
kubectl get ip
kubectl get pod ip
vi pod.yml 
kubectl apply -f pod.yml 
kubectl get pod 
kubectl get pods --show-labels
kubectl get pods --show-label
kubectl get pods --show-labels
kubectl describe pod
kubectl get pod -o wide
kubectl describe pod
vi service.yml
kubectl apply -f service.yml 
vi service.yml
kubectl apply -f service.yml 
vi service.yml
kubectl apply -f service.yml 
vi service.yml
kubectl apply -f service.yml 
vi service.yml
kubectl get pod -o wide
kubectl get service -o wide
vi devnamespace.yml
kubectl apply -f devnamespace.yml 
kubectl get namespace
kubectl get pods
kubectl get pods -n dev-namespace-env
kubectl apply -f pod.yml --namespace=dev-namespace-env
kubectl get namespace
kubectl get pods
kubectl get pods -n dev-namespace-env
vi pod.yml 
kubectl apply -f pod.yml 
vi pod.yml 
ls
vi deploy.yml
cat devnamespace.yml 
kubectl get namespace
kubectl delete namespace dev-namespace-env
kubectl get pods
kubectl delete pods --all
kubectl get pods
kubectl get svc
kubectl get rc
kubectl get replicaset
kubectl delete replicaset tomcat-replica

kubectl get replicaset
kubectl get pod
kubectl get pods
kubectl get nodeport
kubectl apply -f deploy.yml 
kubectl apply -f devnamespace.yml 
kubectl apply -f deploy.yml 
kubectl get namespace
vi deploy.yml 
kubectl apply -f deploy.yml 
kubectl get pods
kubectl get pod dev-namespace-env
kubectl get pod namespace dev-namespace-env
kubectl get pod namespace
kubectl get namespace
kubectl get dev-namespace-env 
kubectl get dev-namespace-env pod
kubectl get pods namespace=dev-namespace-env 
kubectl get pod namespace=dev-namespace-env 
kubectl get pods --all
kubectl get pods
kubectl get pods namespace=dev-namespace-env 
kubectl describe namespace
kubectl describe namespace dev-namespace-env
kubectl get pods
kubectl get pods -A
kubectl get pods
kubectl get pods -n dev-namespace-env
kubectl delete deployment tomcat-nginx-deploymen
kubectl get pod -o wide
kubectl get pod -n dev-namespace-env -o wide
curl -v 10.244.117.223:80
curl -v 10.244.117.223:8080
kubectl get pods svc -o wide
kubectl get pod svc 
kubectl get pod svc app=tomcat
kubectl get svc
kubectl get pod svc tomcat-ngnix
kubectl get pod svc tomcat-ngnix -o wide
curl -v 10.100.119.184:80
curl -v 10.100.119.184:8080
curl -v 10.100.119.184:443
vi newpod.yml
kubectl apply -f newpod.yml 
kubectl get pod
kubectl get pod -n namespcae=dev-namespace-env
kubectl get pod -n dev-namespace-env
kubectl delete pod -n dev-nmaespace-env
kubectl delete pods -n dev-nmaespace-env
kubectl delete pods -n dev-namespace-env
kubectl delete pod -n dev-namespace-env
kubectl delete pod
kubectl delete pod -n dev-namespace-env --all
kubectl get pod -n dev-namespace-env
vi podlimits.yml
kubctl apply -f podlimits.yml 
kubectl apply -f podlimits.yml 
kubectl get resourcequota
kubectl get svc resourcequota
kubectl get rc
kubectl get svc resourceqouta
kubectl get resourceqouta
kubectl get resourcequota -n dev-namespace-env
kubectl get pods resourcequota -n dev-namespace-env
kubectl describe podquota
kubectl describe resourcequota
kubectl describe resourcequota -n dev-namespace-env
vi resourcequota.yml
kubectl apply -f resourcequota.yml 
kubectl get resourcequota -n dev-namespace-env
vi limitrange.yml
kubectl apply -f limitrange.yml 
kubectl get limitrange -n dev-namespace-env
kubectl get limitrange memory-limit-range -n dev-namespace-env
kubectl get pods limitrange -n dev-namespace-env
kubectl get pods limitrange memory-limit-range -n dev-namespace-env
kubectl get pod limitrange memory-limit-range -n dev-namespace-env
kubectl get pod limitrange -n dev-nameaspace-env
kubectl get pods -n dev-nameaspace-env
kubectl get pod -n dev-nameaspace-env
kubectl get pods
kubectl get namesapce
kubectl get namespace
kubectl get pod -n dev-namespace-env
kubectl get namespace
kubectl get resourcequota
kubectl get resourcequota -n dev-namespace-env
kubectl get namespace
kubectl get pod -n dev-namespace-env
kubectl get resourcequota
kubectl get namespace
kubectl get pod -n dev-namespace-env
kubectl get resourcequota -n dev-namespace-env
kubectl get limitrange -n dev-namespace-env
ls
echo "Today assignment"
history 
kubectl get pods --show-label
kubectl get pods --show-labels
kubectl get pods -n dev-namespace-env --show-labels
kubectl label pods -n dev-namespace-env my=tomcat
kubectl get pods -n dev-namespace-env
kubectl label pods tomcat-nginx-deployment-666bc57f8f-cgffd -n dev-namespace-env my=tomcat
kubectl get pod -n dev-namespace-env my=tomcat
kubectl get pod -n dev-namespace-env -l my=tomcat
echo pass the particular label to running pod
history
history > todayextracommands
head -355 todayextracommands | tail -10
head -355 todayextracommands | tail -10 > histroyextralearncommand
cat histroyextralearncommand 
ls
cat newpod.yml 
cat devnamespace.yml 
ls
vi deploy.yml 
kubectl get pods
kubectl get pods -n namespcae
kubectl get pods -n dev-namespace-env
vi deploy.yml 
cat deploy.yml 
kubectl get pods -n dev-namespace-env
vi deploy.yml 
kubectl apply -f deploy.yml 
kubectl get pods -n dev-namespace-env
kubectl get pods tomcat-nginx-deployment-666bc57f8f
kubectl get pods depolyment tomcat-nginx-deployment-666bc57f8f
kubectl get pods depolyment tomcat-nginx-deployment-666bc57f8f -n dev-namespace-env
kubectl get pods tomcat-nginx-deployment-666bc57f8f -n dev-namespace-env
kubectl get pods svc tomcat-nginx-deployment-666bc57f8f -n dev-namespace-env
kubectl get deploment tomcat-nginx-deployment-666bc57f8f -n dev-namespace-env
kubectl get deployment tomcat-nginx-deployment-666bc57f8f -n dev-namespace-env
kubectl get deployment tomcat-nginx-deployment -n dev-namespace-env
vi deploy.yml 
kubectl apply -f deploy.yml 
kubectl get deployment tomcat-nginx-deployment -n dev-namespace-env
vi deploy.yml 
kubectl apply -f deploy.yml 
kubectl get deployment tomcat-nginx-deployment -n dev-namespace-env
kubectl get deployment -n dev-namespace-env
kubectl get pod -n dev-namespace-env
kubectl get deployment -n dev-namespace-env
kubectl delete pod tomcat-nginx-deployment-666bc57f8f-vvhld -n dev-namespace-env
kubectl get deployment -n dev-namespace-env
kubectl get pod -n dev-namespace-env
kubectl delete pod -n dev-namesapce-env
kubectl delete pod depolyment -n dev-namesapce-env
kubectl delete  depolyment -n dev-namesapce-env
kubectl delete pod depolyment -n dev-namesapce-env --all
kubectl delete pod -n dev-namesapce-env --all
kubectl delete deployment -n dev-namesapce-env --all
kubectl delete deployment tomcat-nginx-deploymen -n dev-namesapce-env --all
kubectl delete pod tomcat-nginx-deployment -n dev-namesapce-env --all
kubectl delete deployment tomcat-nginx-deployment -n dev-namesapce-env --all
kubectl delete deployment tomcat-nginx-deployment 
kubectl delete deployment 
kubectl delete deployment tomcat-nginx-deployment
kubectl delete deployment tomcat-nginx-deployment --all
kubectl delete deployment tomcat-nginx-deployment -n dev-namespace-env --all
kubectl delete deployment tomcat-nginx-deployment --all
kubectl delete deployment --all
kubectl delete deployment -n dev-namespace-env --all
kubectl get deployment

kubectl get namespace
kubectl get pods -n dev-namespace-env
kubectl apply -f deploy.yml 
kubectl get pods -n dev-namespace-env
vi deploy.yml 
kubectl delete deployment -n dev-namespace-env --all
kubectl apply -f deploy.yml 
vi deploy.yml 
kubectl apply -f deploy.yml 
vi deploy.yml 
kubectl apply -f deploy.yml 
vi deploy.yml 
kubectl apply -f deploy.yml 
passwd
ls
vi replicaset.yml
vi deployment.yml
vi replicaset.yml 
ls
vi externalip.yml
vi loadbalancer.yml
vi deployment.yml 
vi deploymentaffinity.yml 
kubectl get nodes
kubectl apply -f deploymentaffinity.yml 
kubectl get deployment
kubectl get deployment -n dev-nmaespace-env
kubectl get deployment -n dev-namespace-env
kubectl get pods deployment tomcatdeployment -n dev-namespace-env
kubectl get pods tomcatdeployment -n dev-namespace-env
kubectl get tomcatdeployment -n dev-namespace-env
kubectl get deployment tomcatdeployment -n dev-namespace-env
kubectl get pods tomcatdeployment -n dev-namespace-env
kubectl get pods svc tomcatdeployment -n dev-namespace-env
kubectl get pods deployment tomcatdeployment -n dev-namespace-env
kubectl get pods deployment -n dev-namespace-env
kubectl get deployment -n dev-namespace-env
vi deploymentaffinity.yml 
kubectl apply -f deploymentaffinity.yml 
kubectl get deployment -n dev-namespace-env
kubectl describe deployment
kubectl describe deployment -n dev-namespace-env
kubectl get nodes
vi deploymentaffinity.yml 
kubectl taint node ip-10-0-0-168.us-west-2.compute.internal colour=red:NoSchedule
kubect get deployments
kubect get deployment -n dev-namespace-env
kubectl get deployment -n dev-namespace-env
kubect delete -f deploymentaffinity.yml 
kubectl delete -f deploymentaffinity.yml 
vi deploymentaffinity.yml 
kubectl delete -f deploymentaffinity.yml 
vi deploymentaffinity.yml 
kubectl delete -f deploymentaffinity.yml 
kubectl get deployment
kubectl get deployment -n dev-namespace-env
kubectl delete deployment -n dev-namesapce-env --all
kubectl delete deployment --all -n dev-namesapce-env 
kubectl delete deployment --all 
kubectl delete deployment tomcatdeployment
kubectl delete deployment tomcatdeployment -n dev-namespace-env
kubectl get deployment -n dev-namespace-env
kubect get pods -n namespace-env --show-list
kubect get pods  --show-list
kubectl get pods  --show-list
kubectl get pods  --show-labels
kubectl get pods  --show-labels -n dev-namespace-env
git init
git remote add https://github.com/syedwaliuddin/kubernetes.git
git add remote https://github.com/syedwaliuddin/kubernetes.git
git add remote origin https://github.com/syedwaliuddin/kubernetes.git
git remote add origin https://github.com/syedwaliuddin/kubernetes.git
ls
vi deployment.yml y
apt remove git
ls
vi devnamespace.yml 
vi deployment.yml 
kubectl apply -f deployment.yml 
kubectl get deployment
vi deployment.yml 
kubectl apply -f deployment.yml 
kubectl get deployment
vi deployment.yml 
kubectl apply -f deployment.yml 
kubectl get deployment
vi deployment.yml 
kubectl apply -f deployment.yml 
kubectl get deployment
kubectl delete -f deployment.yml 
kubectl get deployment
vi deployment.yml 
ls
kubectl get pods
kubectl get pod -n dev-namespace-env
kubectl get deployment
kubectl get services
kubectl delete svc tomcat-ngnix -n dev-namespace-env
kubectl delete svc tomcat-ngnix
kubectl delete svc --all
kubectl get services
kubectl get resourcequota
kubectl get resourcequota -n dev-namespace-env
kubectl delete resourcequota --all
kubectl delete resourcequota -n dev-namespace-env --all
kubectl get limitrange
kubectl get limitrange -n dev-namespace-dev
kubectl get limitrange -n dev-namespace
kubectl get limitrange
kubectl get deployment
kubectl get deployment -n dev-namespcae-env
ls
kubectl get loadbalancer 
kubectl get loadbalancer -n dev-namespace-env
kubectl get replicaset
kubectl get replicaset -n ev-namesapce-env
kubectl get pods --all
kubectl get pods --all -n dev-namespace-env
kubectl get nodes df -h
vi pod.yml 
kubctl apply -f pod.yml 
ls
vi devnamespace.yml 
kubectl apply -f pod.yml 
kubectl apply -f devnamespace.yml 
kubectl get namespace
kubectl decribe namespace kube-node-lease
kubectl decribe namespace 
kubectl decribe namespace dev -ns
kubectl describe namespace dev -ns
ls
vi externalip.yml 
kubectl get svc
vi externalip.yml 
kubectl apply -f externalip.yml 
kubectl get svc
curl -v 3.112.230.169:8080
curl -v 10.100.0.1:443
exit
ls
vi service.yml 
kubectl apply -f service.yml 
kubectl get svc
vi service.yml 
curl -v 10.100.213.6:8080
vi service.yml 
kubectl apply -f service.yml 
kubectl get svc
curl -v 10.100.213.6:8080
kubectl get pods -o wide
ls
vi podAffinity.yml
ls
vi config-map.yml
kubectl apply -f config-map.yml 
vi pod-config.yml
kubectl apply -f pod-config.yml 
df -h
kubectl get cm
kubectl get cm game-demo -oyaml
vi volumepodbasic.yml
kubectl apply -f volumepodbasic.yml 
vi volume_deployment.yml
kubectl apply -f volume_deployment.yml 
vi secrets.yml
kubectl apply -f secrets.yml 
kubectl get secrets
kubectl get secrets mysecret -oyaml
echo "MWYyZDFlMmU2N2Rm" | base64 --decode
echo "YWRtaW4=" | base64 --decode
echo "wali" | base64
echo "uddin" | base64
vi secrets.yml 
kubectl create secret generic db-user-pass     --from-literal=username=admin     --from-literal=password='S!B\*d$zDsb='
kubectl get sc
kubectl get secrets
kubectl get secrets db-user-pass -oyaml
vi user
vi admin.conf
kubectl create secret generic myfile --from-file=./username.txt --from-file=./admin.conf
kubectl get secrets myfile -oyaml
echo "dGhpcyBpcyBhIGFkbWluIGNvbmZpZyBmaWxlCg==" | base64 --decode
echo "c3llZAp3YWxpdWRkaW4Kc2FuZ21lc2gKYmh1cmUKcmVoYW4K" | base64 --decode
vi secretsnew.yml
mv secretsnew.yml secretdemo.yml
vi secretdemo.yml 
kubectl apply -f secretdemo.yml 
kubectl get pods
kubectl exec -it secret-test-pod -- /bin/bash
ls
grep jenkins
grep jenkins *
grep -R -l jenkins *
ls
vi nodeaffinity.yml
kubectl get nodes --show-labels
kubectl label node ip-10-0-0-124.us-west-2.compute.internal size=large
kubectl label node ip-10-0-0-168.us-west-2.compute.internal size=small
kubectl get nodes --show-labels 
kubectl explain --recursive pod | less
kubectl explain --recursive pod | less > sample
ls 
vi sample
su - ubuntu
passwd ubuntu
su - ubuntu
passwd 
vi nodeaffinitysoft.yml
kubectl get pods
kubectl apply -f nodeaffinitysoft.yml 
kubectl get pods
kubectl get nodes --show-labels
kubectl get pods -o wide
passwd kubectl get nodes
kubectl get nodes
vi nodeaffinitysoft.yml
kubectl get pods
kubectl delete secret secret-test-pod
kubectl delete secrets secret-test-pod
kubectl delete pod secrets secret-test-pod
kubectl delete pod secret secret-test-pod
ls
vi secretdemo.yml 
kubectl delete -f secretdemo.yml 
kubectl get pods
kubectl delete pod-config.yml 
kubectl delete -f pod-config.yml 
kubectl get pods
kubectl delete pod jenkins
kubectl get pods
kubectl get deploy

kubectl get pods
kubectl apply -f nodeaffinitysoft.yml 
kubectl get pods
kubect get pods -o wide
kubectl get pods -o wide
kubectl get nodes -l size=small
kubectl get nodes -l size=large
vi nodeaffinitysoft.yml 

kubectl get pods
kubectl apply -f nodeaffinitysoft.yml 
kubectl get pods
kubectl get pods -o wide
vi nodeaffinitysoft.yml 
kubectl delete -f nodeaffinitysoft.yml 
kubectl get pods
vi nodeaffinitysoft.yml 
kubectl apply -f nodeaffinitysoft.yml 
vi nodeaffinitysoft.yml 
kubectl apply -f nodeaffinitysoft.yml 
vi nodeaffinitysoft.yml 
kubectl apply -f nodeaffinitysoft.yml 
vi nodeaffinitysoft.yml 
kubectl apply -f nodeaffinitysoft.yml 
kubectl get pods
kubectl get pods -0 wide
kubectl get pods -o wide
vi nodeaffinitysoft.yml 
kubectl apply -f nodeaffinitysoft.yml 
vi nodeaffinitysoft.yml 
ls
vi nodeaffinitysoft.yml 
kubectl apply -f nodeaffinitysoft.yml 
vi nodeaffinitysoft.yml 
kubectl apply -f nodeaffinitysoft.yml 
vi nodeaffinitysoft.yml 
kubectl apply -f nodeaffinitysoft.yml 
vi nodeaffinitysoft.yml 
kubectl apply -f nodeaffinitysoft.yml 
vi nodeaffinitysoft.yml 
kubectl apply -f nodeaffinitysoft.yml ww
kubectl apply -f nodeaffinitysoft.yml 
vi nodeaffinitysoft.yml 
kubectl apply -f nodeaffinitysoft.yml 
vi nodeaffinitysoft.yml 
ls
vi nodeaffinitysoft.yml 
kubectl get pods
kunectl delete pod -f tomcatpod1affi
kubectl delete pod -f tomcatpod1affi
kubectl delete pod tomcatpod1affi
kubectl get pod
vi deploymentaffinity.yml 
kubectl get nodes --show-labels
kubectl apply -f deploymentaffinity.yml 
vi deploymentaffinity.yml 
kubectl apply -f deploymentaffinity.yml 
vi deploymentaffinity.yml 
kubectl apply -f deploymentaffinity.yml 
vi deploymentaffinity.yml 
kubectl get deploy
vi deploymentaffinity.yml 
vi deploypractic.yml
kubectl apply -f deploypractic.yml 
rm -rf deploypractic.yml 
vi deploymentaffinity.yml 
kubectl apply -f deploymentaffinity.yml 
vi deploymentaffinity.yml 
kubectl apply -f deploymentaffinity.yml 
vi deploymentaffinity.yml 
vi deployment.yml 
kubectl apply -f deployment.yml 
kubectl get pods
vi deployment.yml 
vi nodepract.yml
kubectl apply -d nodepract.yml 
kubectl apply -f nodepract.yml 
kubectl get pods
kubectl delete -f nodepract.yml
kubectl get pods
vi nodepract.yml 
kubectl apply -f nodepract.yml 
kubectl get node -o wide
ls
kubectl get pods
kubectl get nodes --show-labels
vi nodepract.yml 
kubectl get pods -o wide

kubectl get deploy
kubectl delete deploy --all
kubectl get deploy
kubectl apply -f nodepract.yml 
kubectl get pods -o wide
vi nodepract.yml 
kubectl delete deploy --all
kubectl get pods -o wide
kubectl apply -f nodepract.yml 
vi nodepract.yml 
kubectl apply -f nodepract.yml 
vi nodepract.yml 
kubectl apply -f nodepract.yml 
vi nodepract.yml 
kubectl apply -f nodepract.yml 
vi nodepract.yml 
kubectl apply -f nodepract.yml 
vi nodepract.yml 
kubectl apply -f nodepract.yml 
vi nodepract.yml 
kubectl apply -f nodepract.yml 
mv  nodepract.yml nodepract.yaml
kubectl apply -f nodepract.yaml 
vi nodepract.yaml 
kubectl apply -f nodepract.yaml 
vi nodepract.yaml 
kubectl apply -f nodepract.yaml 
kubectl get pods -o wide
kubectl get nodes
kubectl get nodes - owdie
kubectl get nodes - owide
kubectl get nodes -o wide
kubectl get pods
kubectl get nodes --show-labels
kubectl get nodes - owdie
kubectl get pods -owide
vi nodepract.yaml

vi nodepract.yaml 
kubectl apply -f nodepract.yaml 
kubectl get pods
kubectl describe pod
kubectl get taint
kubectl get taints
kubectl get nodes
kubectl get taint
kubectl get node taint
kubectl get node -owide
kubectl taint node ip-10-0-0-168.us-west-2.compute.internal colour=green:NoSchedule-
kubectl get pods
kubectl get pods -owide
vi nodepract.yaml 
kubectl apply -f nodepract.yaml 
kubectl get pods
kubectl get pods -owide
kubectl explain --recursive pod | less
kubectl get nodes taint --all
kubectl get nodes taint --show-taint
kubectl get nodes  --show-taint
kubectl get node  --show-taint
kubectl get node  --show-taints
kubectl get taint ip-10-0-0-124.us-west-2.compute.internal
kubectl get nodes --show-labels
kubectl get taint nodes ip-10-0-0-124.us-west-2.compute.internal 
kubectl taint node
kubectl taint node ip-10-0-0-124.us-west-2.compute.internal colour=red:NoSchedule

kubectl taint node ip-10-0-0-124.us-west-2.compute.internal

kubectl taint node ip-10-0-0-124.us-west-2.compute.internal colour=red:NoSchedule-
kubectl get pods
kubectl delete deploy -aal
kubectl delete deploy --all
kubectl get nodes --show-labels
vi nodepract.yaml 
kubectl get pods
kubectl get pods -owide
kubectl apply -f nodepract.yaml 
vi nodepract.yaml 
kubectl apply -f nodepract.yaml 
vi nodepract.yaml 
kubectl apply -f nodepract.yaml 
kubectl get pods
kubectl get pods -owide
vi nodepract.yaml 
kubectl delete deploy --all
kubectl apply -f nodepract.yaml 
vi nodepract.yaml 
kubectl apply -f nodepract.yaml 
kubectl get pods -owide
vi nodepract.yaml 
kubectl delete deploy --all
kubectl apply -f nodepract.yaml 
kubectl get pods -owide
kubectl label node ip-10-0-0-168.us-west-2.compute.internal size=extrasmall
kubectl label node ip-10-0-0-168.us-west-2.compute.internal size-
kubectl label node ip-10-0-0-168.us-west-2.compute.internal size=extrasmall
kubectl get pods -owide
vi abcd.sh
vi file
vi abcd.sh
vi file
vi abcd.sh
grep ip file 
grep pp file 
vi file
ls
rm -rf file 
rm -rf abcd.sh 
ls
vi replicaset.yml 
kubectl get nodes
kubectl get pods
kubectl delete deploy --all
kubectl get pods
kubectl get svc
curl 10.100.78.6:8080
kubectl delete svc --all
vi externalip.yml 
kubectl apply -f externalip.yml 
kubectl get svc
curl 54.218.6.20:8080
curl 54.218.6.20:80

ls
kubectl get endpoints
vi newpod.yml 
kubectl apply -f newpod.yml 
vi service.yml 
kubectl apply -f service.yml 
kubectl get endpoints
mv service.yml service.yaml
kubectl delete svc --all
kubectl apply -f service.yaml 
kubectl get endpoints
kubectl get pods
kubectl delete pod --all
mv newpod.yml newpod.yaml
kubectl apply -f newpod.yaml
kubectl apply -f service.yaml 
kubectl get endpoints
kubectl delete svc --all
vi newpod.yaml 
vi service.yaml 
kubectl apply -f newpod.yaml
kubectl apply -f service.yaml 
kubectl get endpoints
curl 10.244.117.250:8080
vi newpod.yaml 
kubectl apply -f newpod.yaml
kubectl apply -f service.yaml 
kubectl get endpoint
kubectl get pods
kubectl delete svc --all
kubectl delete pods --all
kubectl get nodes
kubectl describe node
kubectl taint node ip-10-0-0-124.us-west-2.compute.internal colour=red:NoSchedule
vi newpod.yaml 
vi deployment.yml 
kubectl apply -f deployment.yml 
kubectl get pods -owide
kubectl delete pod --all
vi deployment.yml 
kubectl apply -f deployment.yml 
kubectl get pods -owide
kubectl delete pods --all
kubectl get pods
kubectl delete -f deployment.yml 
kubectl get pods
vi deployment.yml 
kubectl get nodes --show-labels
kubectl apply -f deployment.yml 
kubectl get pods -owide
kubectl describe node ip-10-0-0-124.us-west-2.compute.internal
kubectl taint node ip-10-0-0-124.us-west-2.compute.internal colour=red:NoSchedule-
kubectl get pods -owide
kubectl taint node ip-10-0-0-124.us-west-2.compute.internal colour=red:NoSchedule-
kubectl label node ip-10-0-0-124.us-west-2.compute.internal size-
kubectl label node ip-10-0-0-168.us-west-2.compute.internal size-
kubectl label node ip-10-0-0-168.us-west-2.compute.internal env=prod

vi deployment.yml 
kubectl apply -f deployment.yml 
kubectl get pods -owide
kubectl apply -f deployment.yml 
kubectl apply -f newpod.yaml 
kubectl get pods -owide
kubectl apply -f newpod.yaml 
vi deployment.yml 
kubectl apply -f deployment.yml 
vi deployment.yml 
kubectl apply -f deployment.yml 
kubectl describe pod
vi qosresource.yml
kubectl apply -f qosresource.yml 
vi qosresource.yml
kubectl apply -f qosresource.yml 
kubectl describe pod
vi daemonsetpractice.yaml
kubectl apply -f daemonsetpractice.yaml 
kubectl get pods -owide
kubectl delete -f deployment.yml 
kubectl get pods -owide
kubectl delete pod tomcat-nginx1
kubectl get pods -owide
vi daemonsetpractice.yaml 
vi newpod.yaml 
kubectl delete -f daemonsetpractice.yaml 
kubectl get pods -owide
kubectl apply -f daemonsetpractice.yaml 
kubectl get pods -owide
vi daemonsetpractice.yaml 
kubectl delete -f daemonsetpractice.yaml 
kubectl apply -f daemonsetpractice.yaml 
vi daemonsetpractice.yaml 
kubectl get pods -owide
vi newpod.yaml 
vi daemonsetpractice.yaml 
kubectl apply -f daemonsetpractice.yaml 
kubectl get pods -owide
vi daemonsetpractice.yaml 
kubectl apply -f daemonsetpractice.yaml 
kubectl get pods -owide
kubectl get pods
kubectl describe pods
vi daemonsetpractice.yaml 
kubectl apply -f daemonsetpractice.yaml 
kubectl get pods
vi daemonsetpractice.yaml 
kubectl apply -f daemonsetpractice.yaml 
vi daemonsetpractice.yaml 
kubectl apply -f daemonsetpractice.yaml 
kubectl get pods
vi daemonsetpractice.yaml 
ls
vi podaffinity.yaml
kubectl get pods
kubectl delete -f daemonsetpractice.yaml 
kubectl get pods
vi newpod.yaml 
kubectl apply -f podaffinity.yaml 
kubectl get pods
kubectl get pods -owdie
kubectl get pods -owide
vi podaffinity.yaml
kubectl delete pod --all
kubectl get pods -owdie
kubectl get pods
kubectl delete -f podaffinity.yaml 
kubectl get pods
ls
vi pv.yml
kubectl apply -f pv.yml 
kubectl get pv
vi pvc.yml
kubectl apply -f pvc.yml 
kubectl get pvc
vi pvcpod.yml
kubectl apply -f pvcpod.yml 
kubectl get pod
kubectl describe pods app

kubectl taint node ip-10-0-0-124.us-west-2.compute.internal colour=red:NoSchedule-
kubectl get nodes --show-labels
kubectl get pod -owide
kubectl describe node
kubectl taint node ip-10-0-0-168.us-west-2.compute.internal colour=green:NoSchedule-
kubectl taint node ip-10-0-0-168.us-west-2.compute.internal node-role.kubernetes.io/master=NoSchedule:NoSchedule-
kubectl taint node ip-10-0-0-168.us-west-2.compute.internal node-role.kubernetes.io/master:NoSchedule-
kubectl get pod -owide
kubectl describe pod
kubectl get nodes --show-lables

kubectl get node --show-labels
kubectl get pods
kubectl get nodes
kubectl taint node ip-10-0-0-168.us-west-2.compute.internal node-role.kubernetes.io/master=,node.kubernetes.io/exclude-from-external-load-balancers=:mNoScedule-
kubectl taint node ip-10-0-0-168.us-west-2.compute.internal node-role.kubernetes.io/master=,node.kubernetes.io/exclude-from-external-load-balancers=:mNoSchedule-
kubectl taint node ip-10-0-0-168.us-west-2.compute.internal node-role.kubernetes.io/master=,node.kubernetes.io/exclude-from-external-load-balancers=:NoSchedule-
kubectl taint node ip-10-0-0-168.us-west-2.compute.internal node-role.kubernetes.io/master=,node.kubernetes.io/exclude-from-external-load-balancers=:mNoSchedule-
ls
vi pvcpod.yml 
vi pv.yml 
kubectl get pv
kubectl delete -f pv.yml 
kubectl get pv
kubectl delete -f pv.yml --force
kubectl delete pv test-pv
kubectl get pv
kubectl delete -f pv.yml --force
kubectl get pvc
kubectl delete pvc ebs-claim
kubectl get pvc
kubectl delete pv test-pv
kubectl get pvc
kubectl get pv
vi pv.yml 
kubectl apply -f pv.yml 
kubectl get pv
vi pvc.yml 
kubectl apply -f pvc.yml 
kubectl get pvc
vi pvcpod.yml 
kubectl apply -f pvcpod.yml 

vi pvcpod.yml 
kubectl get pvc
kubectl get pods -owide
kubectl describe pod app
kubectl get nodes 
kubectl describe nodes 
kubectl describe pods
kubectl get nodes
kubectl apply -k "github.com/kubernetes-sigs/aws-ebs-csi-driver/deploy/kubernetes/overlays/stable/?ref=release-1.14"
git --version
apt install git
kubectl apply -k "github.com/kubernetes-sigs/aws-ebs-csi-driver/deploy/kubernetes/overlays/stable/?ref=release-1.14"
kubectl get pods -owide
kubectl get pods 
kubectl delete pvc app
kubectl get pvc
kubectl delete pvc ebs-claim
kubectl delete pod app
kubectl get pod
kubectl delete pod app --force
kubectl get pod
kubectl delete pvc ebs-claim
kubectl get pvc
kubectl get pv
kubectl delete pv test-pv
kubectl get pv
kubectl delete pv test-pv --force
kubectl get pv
kubectl get pod -A
kubectl apply -f pv.yml 
kubecetl get pv
kubectl get pv
kubectl apply -f pvc.yml 
kubectl get pvc
kubectl apply -f pvcpod.yml 
kubectl get pod
kubectl get pv
kubectl get pvc
kubectl get pod
vi storageclas1.yaml
kubectl apply -f storageclas1.yaml 
kubectl get storageclass
vi scpvc.yaml
kubectl apply -f scpvc.yaml 
vi scpvpod.yaml
kubectl get pv
kubectl get pvc
kubectl get pod
history
kubectl get pv
kubectl get pvc
kubectl get pod
history
kubectl delete pod app
kubectl get pod
kubectl delete pvc ebs-claim
kubectl delete pv test-pv

kubectl get pv
kubectl apply -f scpvpod.yaml 
kubectl get pods
kubectl get pod
kubectl describe pod
kubectl apply -f storageclas1.yaml 
kubectl apply -f scpvpod.yaml 
kubectl get pod
kubectl descibe pof
kubectl descibe pod
kubectl describe pod
kubectl apply -f scpvc.yaml 
kubectl get pod
ls
kubectl get pod
kubectl delete pod app
kubectl get pod
kubectl get pvc
kubectl delete pvc ebs-claim
kubectl delete storageclas
kubectl delete storageclass
kubectl get storageclass
kubectl delete storageclass ebs-sc
ls
vi statefullset.yaml
kubectl apply -f statefullset.yaml 
kubectl get svc
kubectl get sfs
kubectl get sf
kubectl get ss
kubectl get sft
kubectl get sfs
kubectl get stfs
kubectl get sts
kubectl get statefulset
kubectl get pod
kubectl get pod -A
kubectl describe ns kubesystem
kubectl describe  kubesystem
kubectl describe namespace
kubectl get pod
vi statefulset1.yaml
kubectl apply -f statefullset1.yaml 
ls
vi statefulset1.yaml 
kubectl apply -f statefulset1.yaml 
vi statefulset1.yaml 
kubectl delete sts 
kubectl delete sts  --all
kubectl apply -f statefullset.yaml 
kubectl get pod
vi statefulset1.yaml 
kubectl delete sts --all
kubectl get stst
kubectl get sts
vi storageclas1.yaml 
kubectl apply -f storageclas1.yaml 
vi statefullset1yaml 
vi statefullset.yaml 
kubectl get sc
vi statefullset.yaml 
kubectl applu -f statefullset.yaml 
kubectl apply -f statefullset.yaml 
kubectl get sts
kubectl get pods
kubectl get pods -owide
kubectl get nodes
kubectl get logs
kubectl logs pod
kubectl log pod
kubectl logs pods
kubectl logs pods --all
kubectl get logs
kubectl get logs pods
kubectl describe pods
kubectl get sc
kubectl get pv
kubectl get pvc
vi storageclas1.yaml 
kubectl get nodes
kubectl get pv
kubectl get pvc
kubectl get sc
kubectl delete pvc --all
kubectl get sc
kubectl apply -f statefullset.yaml 
vi statefullset.yaml 
kubectl apply -f statefullset.yaml 
vi statefullset.yaml 
kubectl apply -f statefullset.yaml 
kubectl delete -f statefullset.yaml 
kubectl apply -f statefullset.yaml 
kubectl get sts
kubectl get pods
kubectl get podds
kubectl get pods
kubectl get pvc
kubectl delete pod www-web-0
kubectl delete pod web-0
kubectl get pod
kubectl get pvc
kubectl get svc
ls
kubectl get nodes
vi liveliness.yaml
kubectl apply -f liveliness.yaml 
kubectl get livenessprobe
kubectl get liveness
kubectl get livenes
kubectl get pods
kubectl describe pod liveness-exec
kubectl get pods
kubectl delete pod liveness-exec
vi liveliness.yaml 
kubectl apply -f liveliness.yaml 
kubectl get pods
kubectl describe pods
kubectl describe pods liveness-exec
kubectl get pods
kubectl describe pods liveness-exec
vi liveliness.yaml 
kubectl get pod
kubectl log liveness-exec
kubectl logs liveness-exec
kubectl get pod
kubectl describe pod liveness-exec
kubectl get pod
kubectl describe pod liveness-exec
kubectl delete pod liveness-exec
kubectl get pod
kubectl apply -f liveliness.yaml 
kubectl get pod
ls
vi liveliness.yaml 
kubbectl get pod
kubectl get pod
kubectl delete pod liveness-exec
kubectl get pod
kubectl apply -f liveliness.yaml 
kubectl get pod
kubectl describe pod liveness-exec
kubectl get pod
kubectl describe pod liveness-exec
kubectl get pod
kubectl describe pod liveness-exec
kubectl get pod
kubectl describe pod liveness-exec
kubectl get pod
kubectl describe pod liveness-exec
kubectl get pod
kubectl describe pod liveness-exec
kubectl get pod
kubectl describe pod liveness-exec
kubectl get pod
kubectl describe pod liveness-exec
kubectl get pod
kubectl describe pod liveness-exec
kubectl get pod
kubectl describe pod liveness-exec
kubectl get pod
kubectl describe pod liveness-exec
kubectl get pod
