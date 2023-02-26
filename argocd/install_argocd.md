# How to install my way on minikube

- Link ref: https://argo-cd.readthedocs.io/en/stable/getting_started/

1. Go to https://github.com/argoproj/argo-cd/blob/master/manifests/install.yaml
    - Download that file
    - Ctrl F the argocd-server service and edit it however you want. I made it a load balancer and chose a port
2. Make yaml file for creating the argocd namespace
3. Make an ingress and decide how you want to access
4. Are your custom host to C:\Windows\System32\drivers\etc\hosts
    - 127.0.0.1 yourhostname
5. Get your secret for the admin account
    - kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
5. Run minikube tunnel
6. Navigate to http:{yourhost}:{yourport}


# Install from this repo
kubectl apply -k ./argocd/overlay

kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d