NGINX_PATH=/usr/local/nginx

echo "==== ERROR LOGS ===="
sudo cat $NGINX_PATH/logs/error.log

echo "==== ACCESS LOGS ===="
sudo cat $NGINX_PATH/logs/access.log