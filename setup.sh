minikube start --vm-driver=virtualbox --cpus 3 --memory=3000 --disk-size 10000MB
minikube addons enable metallb

eval $(minikube docker-env)
docker pull metallb/speaker:v0.8.2
docker pull metallb/controller:v0.8.2

docker build --no-cache -t nginx-image ./srcs/nginx/
docker build --no-cache -t php-image ./srcs/php/
docker build --no-cache -t wp-image ./srcs/wordpress/
docker build --no-cache -t mysql-image ./srcs/mysql/
docker build --no-cache -t influxdb-image ./srcs/influxdb/
docker build --no-cache -t grafana-image ./srcs/grafana/
docker build --no-cache -t ftps-image ./srcs/ftps/

kubectl apply -f ./srcs/metallb/configmap.yaml
kubectl apply -f ./srcs/nginx/nginx.yaml
kubectl apply -f ./srcs/php/php.yaml
kubectl apply -f ./srcs/wordpress/wp.yaml
kubectl apply -f ./srcs/mysql/mysql.yaml
kubectl apply -f ./srcs/influxdb/influxdb.yaml
kubectl apply -f ./srcs/grafana/grafana.yaml
kubectl apply -f ./srcs/ftps/ftps.yaml

minikube dashboard