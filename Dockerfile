FROM tiangolo/nginx-rtmp as base

FROM base as server

WORKDIR /nginx-streaming-server

RUN apt-get update && apt-get install -y ffmpeg
COPY nginx.conf /etc/nginx/nginx.conf

COPY . .

# RUN touch /var/local/nginx/access.log
# RUN touch /var/local/nginx/error.log

RUN ln -sf /dev/stdout /var/log/nginx/access.log && \
    ln -sf /dev/stderr /var/log/nginx/error.log
    
CMD ["bash", "./start.sh"]