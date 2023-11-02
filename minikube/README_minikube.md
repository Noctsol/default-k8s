# How to set up minikube

1. Install it on windows. I tired installing in WSL but got tons of issues. You can use this to upgrade it also:
```shell
# https://minikube.sigs.k8s.io/docs/start/
# curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
# sudo install minikube-linux-amd64 /usr/local/bin/minikube

New-Item -Path 'c:\' -Name 'minikube' -ItemType Directory -Force
Invoke-WebRequest -OutFile 'c:\minikube\minikube.exe' -Uri 'https://github.com/kubernetes/minikube/releases/latest/download/minikube-windows-amd64.exe' -UseBasicParsing

$oldPath = [Environment]::GetEnvironmentVariable('Path', [EnvironmentVariableTarget]::Machine)
if ($oldPath.Split(';') -inotcontains 'C:\minikube'){
  [Environment]::SetEnvironmentVariable('Path', $('{0};C:\minikube' -f $oldPath), [EnvironmentVariableTarget]::Machine)
}

```

2. Enable addons
```shell
minikube addons enable ingress
minikube addons enable ingress-dns
minikube addons enable dashboard

# To list all of them
minikube addons list
```
3. Set up ingress. Were setting it up to auto pick up anything under the .localtest domain
```shell
Add-DnsClientNrptRule -Namespace ".localtest" -NameServers "$(minikube ip)"
Get-DnsClientNrptRule | Where-Object {$_.Namespace -eq '.localtest'} | Remove-DnsClientNrptRule -Force; Add-DnsClientNrptRule -Namespace ".localtest" -NameServers "$(minikube ip)"

Add-DnsClientNrptRule -Namespace ".test" -NameServers "$(minikube ip)"
Get-DnsClientNrptRule | Where-Object {$_.Namespace -eq '.test'} | Remove-DnsClientNrptRule -Force; Add-DnsClientNrptRule -Namespace ".test" -NameServers "$(minikube ip)"
```

4. Run
```shell
minikube start
```

5. (Optional) If you see something like the following
    - Kubernetes 1.27.4 is now available. If you would like to upgrade, specify: --kubernetes-version=v1.27.4
        - run ```minikube start --kubernetes-version={recommended_version}```
    - Image was not built for the current minikube version. To resolve this you can delete and recreate your minikube cluster using the latest images. Expected minikube version: v1.29.0 -> Actual minikube version: v1.31.2
        - run the following:
        ```
        # This will wipe any data you have
        minikube delete
        minikube start
        ```

# Links
- Info on MINIKUBE INGRESS: https://minikube.sigs.k8s.io/docs/handbook/addons/ingress-dns/