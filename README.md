# default-k8s
Contains the following:
- Stuff I spam for various projects: argocd, prometheus, etc
- Examples of building containers for various coding languages with varying set ups and pushing them to kubertnetes
- Beginner Friendly Stuff
- A guide on how to set up minikube. I use a WSL & windows set up.


# Things you need to install
I ran everything on WSL ubuntu 22.04 lts. You can manage docker containers simultaneously through windows/wsl.
- minikube
- docker/docker desktop
- kubectl


# Kubernetes
## What the heck is it?
To answer in the shortest way possible in a way that makes sense. Imagine you have hundreds of containers you want to deploy. You could spin up a bunch of virtual machines and log onto random ones deploy them and manually check resource constraints and etc. But that would be painful. Kubernetes takes that whole process and **manages** it for you.

Here's some scenarios:
- If you have 100 containers with different memory/cpu requirements, the k8s scheduler will figure out how to deploy everything accross multiple servers. It will tell you if you're going to crap the bed.
- Need to have multiple containers accross different VMs load balanced and be automatically able to spin up new isntances/replicas to scale out? k8s.
- Need to run some script on some machine? Just run it on k8s. Provisions resources and then destroys it. No need to logonto a VM and configure it.

This is is a hard question to answer if you don't have any prebuilt concepts. If you don't know anything keep learning. At this point in my career, I've learned so many new things that I just trust the process. I will spend a week going something like "???" and then wake up one morning and new concepts will have formulated inside my head. TRUST THE DAMN PROCESS. Choose something small and specific to do and see it through and stuff will eventually make it sense.



Links
- https://superuser.com/questions/1126721/rebooting-ubuntu-on-windows-without-rebooting-windows
- https://minikube.sigs.k8s.io/docs/handbook/addons/ingress-dns/