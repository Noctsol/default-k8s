#Create network
# You need to do this if not using k8s to lets your container be able to talk to each other
docker network create wordpress


# Changing directoru to access docker files
echo "$PWD"
cd thatdevopsguy/dockerfiles


wp_img_exists=$(docker image ls | grep wordpress)
wp_cn_exists=$(docker container ls | grep wordpress)

if [ -z "$wp_img_exists" ]; then
    echo "Building wordpress image"
    docker build -f wordpress.dockerfile . -t aimvector/wordpress-example
fi

# http://locathost/
if [ -z "$wp_cn_exists" ]; then
    echo "Running wordpress container"
    docker run -d \
    -p 80:80 \
    --name wordpress \
    --net wordpress \
    -e WORDPRESS_DB_HOST=mysql \
    -e WORDPRESS_DB_USER=exampleuser \
    -e WORDPRESS_DB_PASSWORD=examplepassword \
    -e WORDPRESS_DB_NAME=exampledb \
    aimvector/wordpress-example


    # docker run --name wordpress -d -p 80:80 --net wordpress aimvector/wordpress-example
fi

mysql_img_exists=$(docker image ls | grep mysql)
mysql_cn_exists=$(docker container ls | grep mysql)


mkdir /data/test/mysqldata

if [ -z "$mysql_img_exists" ]; then
    echo "Building mysql image"
    docker build -f mysql.dockerfile . -t aimvector/mysql-example
fi


# http://localhost/
if [ -z "$mysql_cn_exists" ]; then
    echo "Running mysql container"
    docker run --rm -d \
    --name mysql \
    --net wordpress \
    -e MYSQL_DATABASE=exampledb \
    -e MYSQL_USER=exampleuser \
    -e MYSQL_PASSWORD=examplepassword \
    -e MYSQL_RANDOM_ROOT_PASSWORD=1 \
    -v /data/test/mysqldata:/var/lib/mysql \
    aimvector/mysql-example

fi


#username : testadmin
#password : localpass
#email : somewhereover@yolo.com