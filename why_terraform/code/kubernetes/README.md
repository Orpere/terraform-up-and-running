# How to use this repo 

This repo shows how kubernetes orchestrate containers.

- install [minikube](https://kubernetes.io/docs/tasks/tools/install-minikube/)

- [X] Start your cluster
- [x] deploy one application
- [x] watch it work
- [x] scale up your application
- [x] destroy minikube
  
1. start minikube

```bash
minikube start
😄  minikube v1.5.2 on Darwin 10.14.6
✨  Automatically selected the 'virtualbox' driver
💿  Downloading VM boot image ...
    > minikube-v1.5.1.iso.sha256: 65 B / 65 B [--------------] 100.00% ? p/s 0s
    > minikube-v1.5.1.iso: 143.76 MiB / 143.76 MiB [-] 100.00% 7.42 MiB p/s 19s
🔥  Creating virtualbox VM (CPUs=2, Memory=2000MB, Disk=20000MB) ...
🐳  Preparing Kubernetes v1.16.2 on Docker '18.09.9' ...
💾  Downloading kubelet v1.16.2
💾  Downloading kubeadm v1.16.2
🚜  Pulling images ...
🚀  Launching Kubernetes ... 
⌛  Waiting for: apiserver
🏄  Done! kubectl is now configured to use "minikube"
```

1. deploy an application (nginx)

```bash
kubectl apply -f nginx.yaml
```

2. watch it work
    . the follow command should show you the service url

```bash
minikube service nginx --url
```

3. scale up your application

. check the number of pods running

```bash
    kubectl get pods
    NAME                     READY   STATUS              RESTARTS   AGE
    nginx-85ff79dd56-9q76g   0/1     ContainerCreating   0          17s
    nginx-85ff79dd56-hd4sl   0/1     ContainerCreating   0          17s
    nginx-85ff79dd56-nsk5g   0/1     ContainerCreating   0          17s
```

. as you can see 3 pods 
        . on nginx.yaml replace the number of replicas for the value you want example: from replicas: 3 to 4

```bash
replicas: 4
```

. run the command

```bash
kubectl apply -f nginx.yaml
deployment.apps/nginx configured
service/nginx unchanged
```

. check the replicas

```bash
kubectl get pods
NAME                     READY   STATUS    RESTARTS   AGE
nginx-85ff79dd56-9q76g   1/1     Running   0          17m
nginx-85ff79dd56-dnrtw   1/1     Running   0          70s
nginx-85ff79dd56-hd4sl   1/1     Running   0          17m
nginx-85ff79dd56-nsk5g   1/1     Running   0          17m
```
4. destroy minikube

```bash
minikube delete 
🔥  Deleting "minikube" in virtualbox ...
💔  The "minikube" cluster has been deleted.
🔥  Successfully deleted profile "minikube"
```
