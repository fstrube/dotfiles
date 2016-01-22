For Apache, add the following to a file in /etc/apache2/conf.d

~~~~
Include /home/franklin/.http/vhosts/*.apache
~~~~

For Nginx, add the following to /etc/nginx.conf

~~~~
Include /home/franklin/.http/vhosts/*.nginx
~~~~
