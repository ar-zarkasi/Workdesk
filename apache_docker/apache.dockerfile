FROM httpd:alpine
RUN sed -i \
    -e 's/^#\(Include .*httpd-ssl.conf\)/\1/' \
    -e 's/^#\(LoadModule .*mod_rewrite.so\)/\1/' \
    -e 's/^#\(LoadModule .*mod_ssl.so\)/\1/' \
    -e 's/^#\(LoadModule .*mod_socache_shmcb.so\)/\1/' \
    -e 's/^#\(LoadModule .*mod_proxy.so\)/\1/' \
    -e 's/^#\(LoadModule .*fcgi.so\)/\1/' \
    -e 's/^#\(LoadModule .*mod_proxy_http.so\)/\1/' \
    -e 's/^#\(LoadModule .*mod_proxy_.*\)/\1/' \
    -e 's/^#\(LoadModule .*mod_slotmem_shm.so\)/\1/' \
    -e 's/^#\(LoadModule .*mod_xml2enc.*\)/\1/' \
    -e 's/^#\(LoadModule .*mod_watchdog.*\)/\1/' \
    conf/httpd.conf
# RUN mkdir /usr/local/apache2/conf/external
RUN echo "ServerName localhost" >> /usr/local/apache2/conf/httpd.conf
RUN echo "Include /usr/local/apache2/conf/external/*.conf" >> /usr/local/apache2/conf/httpd.conf
RUN chown -R www-data:www-data /usr/local/apache2/htdocs
