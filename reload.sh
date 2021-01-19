EXEC_NGINX_PATH=/usr/local/sbin/nginx


truncate -s 0 /var/log/nginx/error.log
truncate -s 0 /var/log/nginx/access.log

# sudo truncate -s 0 $NGINX_PATH/logs/error.log
cp ./nginx.conf /etc/nginx/nginx.conf
echo "Apply new configuration ========="

$EXEC_NGINX_PATH -t     # Validate configuration
echo "Test NGINX configuration ========="

$EXEC_NGINX_PATH -s reload
echo "Reload NGINX Server =============="