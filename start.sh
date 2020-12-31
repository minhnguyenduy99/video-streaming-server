NGINX_PATH=/usr/local/nginx
EXEC_NGINX_PATH=$NGINX_PATH/sbin/nginx

sudo mkdir -p tmp   
sudo mkdir -p tmp/record
sudo find ./tmp -type d -exec sudo chown -R nobody: {} +


sudo truncate -s 0 $NGINX_PATH/logs/error.log
sudo truncate -s 0 $NGINX_PATH/logs/access.log
sudo cp ./nginx.conf $NGINX_PATH/conf/nginx.conf
echo "Apply new configuration =========="

sudo $EXEC_NGINX_PATH -t     # Validate configuration
echo "Test NGINX configuration ========="

# bash ./stats.sh
# echo "Create stats folder =============="

sudo $EXEC_NGINX_PATH
echo "Run NGINX Server ================="
