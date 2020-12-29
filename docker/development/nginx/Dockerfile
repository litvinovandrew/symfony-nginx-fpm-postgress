FROM nginx:1.18

ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm
ARG HOST_UID=1000
ARG HOST_IP=0.0.0.0

RUN echo Europe/Berlin > /etc/timezone && \
    dpkg-reconfigure -f noninteractive tzdata

RUN apt-get update && apt-get install -y vim && apt-get install -y unzip
RUN apt-get install -y php7.3-fpm

RUN apt-get install -y libpq-dev 
RUN apt-get install -y php-pgsql php-xml php-zip


COPY .bashrc /root/.bashrc
COPY default.conf /etc/nginx/conf.d/default.conf 
COPY default.conf /etc/nginx/conf.d/default.conf 


# # Install composer
RUN set -x && curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer

# Add permission for www-data
RUN usermod -u ${HOST_UID} www-data \
    && groupmod -g ${HOST_UID} www-data

RUN mkdir  /var/www && mkdir /run/php

# Copy user data
RUN chsh -s /bin/bash www-data \
    && cp /root/.bashrc /var/www/.bashrc \
    && cp -r /root/.composer /var/www/.composer 

# Change owner
RUN chown -R www-data:www-data /var/www

# Adjust groups
RUN usermod -a -G  www-data nginx

# remove log files 
RUN rm /var/log/nginx/error.log 
RUN rm /var/log/nginx/access.log

VOLUME ["/var/www/html"]

EXPOSE 80 1357 9000

# add process manager
# RUN apt-get install -y supervisor
# COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
# CMD ["/usr/bin/supervisord", "-n -c /etc/supervisor/conf.d/supervisord.conf"]

# COPY startup.sh /var/www/startup.sh
# CMD ["/bin/bash", "/var/www/startup.sh"]
CMD cd /var/www/html && service nginx start && service php7.3-fpm start && tail -f /var/log/nginx/error.log