# dockers install
make network-init
make nginx-init
make postgress-init


# symfony install
- docker exec -it nginx bash
- usr 
- cd /var/www/html
- composer update

# symfony db
change config/packages/doctrine.yaml for postgress support
change .env
     DATABASE_URL=pgsql://root:root123@172.23.0.2:5432/app 


# make enity



