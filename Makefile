network-init:
	-docker network rm symfonynet
	docker network create --ip-range 172.23.0.0/24 --subnet 172.23.0.0/16  symfonynet

nginx-init:
	-docker rm -f nginx
	docker build --file=docker/development/nginx/Dockerfile --tag=nginx:1.18.0 docker/development/nginx
	docker run -d --name nginx --network "symfonynet" --ip 172.23.0.3 -v /home/andrii/projects/symfony/my-project-manager/manager/:/var/www/html nginx:1.18.0

postgress-init:
	-docker rm -f postgress
	docker build --file=docker/development/postgres/Dockerfile --tag=postgress:1.12 docker/development/postgres
	docker run -d --name postgress --network "symfonynet" --ip 172.23.0.2 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=root123 -e POSTGRES_DB=app postgress:1.12
	