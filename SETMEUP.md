# Things you'll need to Install or Get

Here's a quick run down and direction(below) on how to set things up.

### Required
- A Linux VM/Computer - Unfortunately, minikube is basically useless when dealing with ingress on windows or WSL. I had to use hyper-V and ended up deploying a ubuntu-22.04-desktop vm.
- kubectl - CLI tool everyone uses for k8s
- Docker - Our given container runtime
- minikube - Will lets you run a local k8s cluster

## How to set up Hyper-V VM
1. Make sure you have a windows license that gives you access to it
2. Enable it on the features
3. When you open up thhhe Hyper-V UI, just hit quick create and create the most recent ubuntu version.At this point, you can just walk through the set up and be done. The rest is optional.
4. (optional but eventually required) You will only allocate something like ~16GB at the beginning. I increased mine to ~32GB. You can find the link below
5. (optional) - Move hard drive directory somewhere else. I recommend doing this right away if you want but the vdhx file in a specific SSD/HDD. 

#### Linux VM - Links
- [How to Enable XRDP for Hyper-V Ubuntu](https://superuser.com/questions/1773172/remote-desktop-cant-connect-to-hyper-v-ubuntu-v22-04-guest)
- [How to Expand Disk Virtual Disk](https://linguist.is/2020/08/12/expand-ubuntu-disk-after-hyper-v-quick-create/)



## How to set up Kubectl
```shell
# https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/#install-kubectl-binary-with-curl-on-linux
# Download
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

# Validate
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check

# Install
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

# Check Install
kubectl version --client

```



## How to set up Docker
```shell
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Add the repository to Apt sources:
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update to new package info
sudo apt-get update

# Install
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Test
sudo docker run hello-world

```



## How to set up minikube

1. Download and install minikube. 
```shell
# https://minikube.sigs.k8s.io/docs/start/
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
```
2. Run
```shell
minikube start
```

2. Enable addons - you need the ingress ones
```shell
minikube addons enable ingress
minikube addons enable ingress-dns
minikube addons enable dashboard

# To list all of them
minikube addons list
```

3. (Optional) If you see something like the following
    - Kubernetes 1.27.4 is now available. If you would like to upgrade, specify: --kubernetes-version=v1.27.4
        - run ```minikube start --kubernetes-version={recommended_version}```
    - Image was not built for the current minikube version. To resolve this you can delete and recreate your minikube cluster using the latest images. Expected minikube version: v1.29.0 -> Actual minikube version: v1.31.2
        - run the following:
        ```
        # This will wipe any data you have
        minikube delete
        minikube start
        ```
4. Ingress will work from this point on out but you will have to be cognizant of a couple things:
    - Ingress routes will always go through $(minikube ip). If you are running outside of a linux OS, you will have to run minikube tunnel and cry.
    - You will need to manually add records to your /etc/hosts files based on what you put into your ingress hosts.
        - Template: {minikube ip} mylocalthing.extension
        - Actual Example: 192.168.49.4 myapisandbox.test

#### minikube - Links
- [Minikube Ingress Quick Start](https://minikube.sigs.k8s.io/docs/handbook/addons/ingress-dns/)





