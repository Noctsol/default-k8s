Link ref: https://argo-cd.readthedocs.io/en/stable/getting_started/


# Install
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/core-install.yaml
# Expose externally
kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "LoadBalancer"}}'


# Install CLI
curl -sSL -o argocd-linux-amd64 https://github.com/argoproj/argo-cd/releases/latest/download/argocd-linux-amd64
sudo install -m 555 argocd-linux-amd64 /usr/local/bin/argocd
rm argocd-linux-amd64