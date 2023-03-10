kubectl -n cms create secret generic wordpress \
--from-literal WORDPRESS_DB_HOST=mysql \
--from-literal WORDPRESS_DB_USER=exampleuser \
--from-literal WORDPRESS_DB_PASSWORD=examplepassword \
--from-literal WORDPRESS_DB_NAME=exampledb

kubectl -n cms create secret generic mysql \
--from-literal MYSQL_USER=exampleuser \
--from-literal MYSQL_PASSWORD=examplepassword \
--from-literal MYSQL_DATABASE=exampledb


kubectl -n cms get secret




kubectl -n cms apply -f ./thatdevopsguy/yaml/deployment.yml
kubectl -n cms get pods

kubectl -n cms apply -f ./thatdevopsguy/yaml/service.yml
kubectl -n cms get svc

kubectl get storageclass


kubectl -n cms apply -f ./thatdevopsguy/yaml/statefulset.yml

kubectl -n cms get pods

kubectl -n cms get pods
kubectl -n cms port-forward <pod-name> 80



kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.1.3/deploy/static/provider/cloud/deploy.yaml
kubectl -n ingress-nginx get pods
kubectl -n ingress-nginx --address 0.0.0.0 port-forward svc/ingress-nginx-controller 80

kubectl -n cms apply -f ./thatdevopsguy/yaml/ingress.yaml