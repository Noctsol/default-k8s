# How to install my way on minikube

- Link ref: https://argo-cd.readthedocs.io/en/stable/getting_started/

1. Go to https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
    - Download that file
    - Ctrl F the argocd-server service and edit it however you want. I made it a load balancer and chose a port
2. Make yaml file for creating the argocd namespace
3. Make an ingress and external service decide how you want to access
4. Are your custom host to /etc/hosts
    - $(minikube ip) yourhostname
5. Get your secret for the admin account
    - kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
6. Navigate to http:{yourhost}:{yourport}
7. Argo uses TLS by default. We need to make a self-signed cert. We could disable it but that wouldn't mirror an actual deployment so we have 3 options:
    - Use a secrets manager(hashivault, etc) and add cert to it and  pull from there. I do have a deployment of hashivault.
    - (easiest) Add it manually:
```shell
### Making a self-signed cert
# https://stackoverflow.com/questions/14267010/how-to-create-self-signed-ssl-certificate-for-test-purposes
openssl genrsa 2048 > private.pem
openssl req -x509 -days 4000 -new -key argocd.test.key -out argocd.test.crt

### Adding it a secret to argo
kubectl delete secret argocd-server-tls -n argocd 
kubectl create -n argocd secret tls argocd-server-tls \
  --cert=/home/linuxadmin/random/argocd.test.crt \
  --key=/home/linuxadmin/random/argocd.test.key



```

# Links
- [Troubleshoot INGRESS/HTTPS](https://github.com/argoproj/argo-cd/issues/2953)

# Useful Commands
```
# Install from this repo
kubectl apply -k ./argocd/overlay

# Get Admin Secret for argo
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d

# Follow logs (you need to get the name)
kubectl logs --tail=200 argocd-server-54f5ccfc58-8tchj  -n argocd

# Download File for install
curl https://raw.githubusercontent.com/argoproj/argo-cd/master/manifests/install.yaml --output install_argo.yml

# Restart via rescaling
kubectl scale -n argocd deployment/argocd-server --replicas=0 && kubectl scale -n argocd deployment/argocd-server --replicas=1

