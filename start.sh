EXEC_NGINX_PATH=/usr/local/sbin/nginx

mkdir -p tmp   
mkdir -p tmp/record
find ./tmp -type d -exec chown -R nobody:root {} +

# truncate -s 0 /var/log/nginx/error.log
# truncate -s 0 /var/log/nginx/access.log
echo "Apply new configuration =========="

$EXEC_NGINX_PATH -t     # Validate configuration
echo "Test NGINX configuration ========="

# bash ./stats.sh
# echo "Create stats folder =============="

$EXEC_NGINX_PATH -g "daemon off;"
echo "Run NGINX Server ================="