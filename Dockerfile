#Base image
FROM php:7.2-apache
Copy www /var/www/html/
#Install musqli
RUN docker-php-ext-install mysqli
