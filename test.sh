
mkdir ./tmp/record/hls/test_123-1604889502_512K
mkdir ./tmp/record/hls/test_123-1604889502_720K
mkdir ./tmp/record/hls/test_123-1604889502_1080K

ffmpeg -i /home/h17airwalk/stream-server/rtmp-server/tmp/record/test_123-1604889502.flv \
-c:v libx264 -b:v 512K -f hls -hls_time 20 /home/h17airwalk/stream-server/rtmp-server/tmp/record/hls/test_123-1604889502_512K/test_123-1604889502_512K.m3u8 \
-c:v libx264 -b:v 720K -f hls -hls_time 20 /home/h17airwalk/stream-server/rtmp-server/tmp/record/hls/test_123-1604889502_720K/test_123-1604889502_720K.m3u8 \
-c:v libx264 -b:v 1080K -f hls -hls_time 20 /home/h17airwalk/stream-server/rtmp-server/tmp/record/hls/test_123-1604889502_1080K/test_123-1604889502_1080K.m3u8 \