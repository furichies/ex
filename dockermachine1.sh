echo 'FROM alpine\nMAINTAINER res@res.es\nCMD [ "/bin/sh" ]' > Dockerfile
docker build -t alpine2 .
cat /vagrant/id_rsa.pub >> /home/vagrant/authorized_keys
cat <<EOF> docker-compose.yaml
version: '3'

services:
  mariadb:
    image: mariadb
    container_name: mariadb
    restart: always
    environment:
      MYSQL_DATABASE: bd_wp
      MYSQL_USER: user_wp
      MYSQL_PASSWORD: CaM1n0K0yoT3
      MYSQL_ROOT_PASSWORD: CaM1n0K0yoT3
    volumes:
      - /opt/mysql_wp:/var/lib/mysql
    networks:
      - red_interna

  wordpress:
    image: wordpress
    container_name: wordpress
    restart: always
    environment:
      WORDPRESS_DB_HOST: mariadb
      WORDPRESS_DB_USER: user_wp
      WORDPRESS_DB_PASSWORD: CaM1n0K0yoT3
      WORDPRESS_DB_NAME: bd_wp
    ports:
      - "80:80"
    volumes:
      - /opt/wordpress:/var/www/html/wp-content
    networks:
      - red_interna

networks:
  red_interna:
    driver: bridge
EOF



