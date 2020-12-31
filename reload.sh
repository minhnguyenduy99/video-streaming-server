NGINX_PATH=/usr/local/nginx
EXEC_NGINX_PATH=$NGINX_PATH/sbin/nginx


sudo truncate -s 0 $NGINX_PATH/logs/error.log
sudo truncate -s 0 $NGINX_PATH/logs/access.log

# sudo truncate -s 0 $NGINX_PATH/logs/error.log
sudo cp ./nginx.conf $NGINX_PATH/conf/nginx.conf
echo "Apply new configuration ========="

sudo $EXEC_NGINX_PATH -t     # Validate configuration
echo "Test NGINX configuration ========="

sudo $EXEC_NGINX_PATH -s reload
echo "Reload NGINX Server =============="