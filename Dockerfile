FROM nginx

ARG WWWUSER=1000
ARG WWWGROUP=1000

COPY nginx.conf /etc/nginx/templates/default.conf.template

RUN apt-get update \
    && apt-get install -y iputils-ping \
    && mkdir /var/www/ -p \
    && echo "alias ls='ls -la --color --group-directories-first'" >> /var/www/.bashrc \
    && usermod -u $WWWUSER www-data \
    && groupmod -g $WWWGROUP www-data \
    && chown www-data:www-data -R \
        /var/cache/nginx \
        /var/www/ \
        /etc/nginx \
        /run

USER www-data
