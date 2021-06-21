<h3>Environment Development for PHP Programmer Using Docker</h3>

<p><strong>-------</strong></p>
<ul>
    <li>httpd:alpine</li>
    <li>mariadb:10.6.2</li>
    <li>php:5.6-fpm</li>
    <li>php:7.4-fpm</li>
    <li>php:8.0 <strong>soon...</strong></li>
</ul>
<p> Enabled Extension on each php </p>
<ol>
    <li>memcached</li>
    <li>imagick</li>
</ol>
<p><strong>-------</strong></p>

1. for your apache config see file apache_docker/conf/default.conf and create your own conf
2. for your config php-fpm see php_docker/zz_docker-{your version php}.conf and modify on your own
3. place your project PHP in www folder
4. when your using mysql in this docker container with your project, use "database" instead localhost or 127.0.0.1
5. when your access in your host pc, access database with localhost/127.0.0.1 port 3306
6. you can modify php.ini using docker exec -it (php5.6 or php7.4) /bin/bash , locate in /usr/local/etc/php/php.ini
7. access via your browser "http://localhost" to see php 5.6 and "https://localhost" to see php 7.4


ENJOY