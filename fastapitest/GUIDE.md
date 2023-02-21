# How to run fast api
- Literally best guide: https://www.youtube.com/watch?v=-ykeT6kk4bk
1. Change he working dir to this folder
2. pip install -r requirements.txt
3. uvicorn main:app
    - Basically you neeed to target the file that has FastAPI() and the variable it got assigned to. In this case, it's main.py and the variable was app. Hence, main:app
    - **uvicorn main:app --reload** will reload the server everytime you make changes to the file. Kinda like react. Benefits of running on dynamic languages and all that.
4. Hit your api at http:localhost:8000 or http:/127.0.0.1:8000


# How to build/run a docker container
1. Change the working dir to this folder
2. At this point, you have to know how docker files work. You essentially need to tell docker what to build the container.
3. docker build -t {yourusername}/fastapitest:{tag} .
    - example: **docker build -t nocstol/fastapitest:00.03 -f fastapitest.Dockerfile .**
    - If you have a Dockerfile names something other than **Dockerfile**, you will need to specify the filename with the -f argumeent
4. docker run -d --name mycontainer -p 8000:8000 -t {yourusername}/fastapitest:{tag}
    - example: **docker run -d --name mycontainer -p 8000:8000 -t noctsol/fastapitest:00.03**


# Deploying to kubernetes using normal manifests file
kubectl apply -f ./fastapitest/manifests_default_dev/namespace.yml
kubectl apply -f ./fastapitest/manifests_default_dev/configmap.yml
kubectl apply -f ./fastapitest/manifests_default_dev/deployment.yml
kubectl apply -f ./fastapitest/manifests_default_dev/service.yml


# Deploy to kubernetes using kustomization
kubectl apply -k ./fastapitest/app_environments/dev