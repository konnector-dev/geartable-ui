
FROM php:7.3-apache

EXPOSE 80

# Copy local code to the container image.
COPY . /var/www/html/

RUN service apache2 restart
# Use the PORT environment variable in Apache configuration files.
RUN sed -i 's/80/${PORT}/g' /etc/apache2/sites-available/000-default.conf /etc/apache2/ports.conf

RUN chmod -R 777 .
#ENV APACHE_DOCUMENT_ROOT /var/www/html/public

# Authorise .htaccess files
# RUN sed -i '/<Directory \/var\/www\/>/,/<\/Directory>/ s/AllowOverride None/AllowOverride All/' /etc/apache2/apache2.conf

# RUN sed -ri -e 's!/var/www/html!/var/www/html/public!g' /etc/apache2/sites-available/*.conf
# RUN sed -ri -e 's!/var/www/!/var/www/html/public!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf