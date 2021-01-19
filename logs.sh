NGINX_LOGS_PATH=/var/log/nginx

echo "==== ERROR LOGS ===="
echo > $NGINX_LOGS_PATH/error.log

echo "==== ACCESS LOGS ===="
echo > $NGINX_LOGS_PATH/access.log