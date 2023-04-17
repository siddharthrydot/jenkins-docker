FROM drupal:8.7 
RUN apt-get update && apt-get install -y libxml2-dev imagemagick mysql-client --no-install-recommends
RUN docker-php-ext-install mysqli && docker-php-ext-enable mysqli
RUN { \ echo 'memory_limit = 196M'; \ echo 'display_errors = Off'; \ echo 'post_max_size = 64M'; \ echo 'file_uploads = On'; \ echo 'upload_max_filesize = 64M'; \ echo 'max_file_uploads = 20'; \ } > /usr/local/etc/php/conf.d/codekoalas-settings.ini
RUN sed -i 's/\/var\/www\/html/\/var\/www\/html\/docroot/g' /etc/apache2/sites-available/000-default.conf
RUN rm -rf /var/www/html/* COPY ./ /var/www/html RUN apache2-foreground

