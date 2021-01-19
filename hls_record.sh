#!/bin/bash

RECORD_FOLDER_DIR=/nginx-streaming-server/tmp/record
HLS_FOLDER_DIR=/nginx-streaming-server/tmp/record/hls
file=""

## Use this command for sudo only
# sudo chown -R nobody:nogroup tmp
# sudo chmod a+rwX tmp

mkdir -p $HLS_FOLDER_DIR

while getopts "f:r:" opt; do
    case $opt in
        f)
            file="${RECORD_FOLDER_DIR}/${OPTARG}"
            # If the stream is not in record mode
            if [ ! -e $file ] 
            then
                exit 0
            fi
            ;;
        r)
            record_name=$OPTARG
            ;;
        \?)
            echo "Usage: cmd [-file] [-record_name]"
            ;;
    esac
done



record_folder="${HLS_FOLDER_DIR}/${record_name}"

mkdir $record_folder

ffmpeg -i $file \
    -preset slow -g 48 -sc_threshold 0 \
    -hls_flags second_level_segment_index \
    -map 0:v -map 0:a -map 0:v -map 0:a -map 0:v -map 0:a \
    -c:v:0 libx264 -c:a:0 aac -b:v:0 512k  -b:a 32k  \
    -c:v:1 libx264 -c:a:1 aac -b:v:1 720k  -b:a 64k  \
    -c:v:2 libx264 -c:a:2 aac -b:v:2 1080K -b:a 128k \
    -var_stream_map "v:0,a:0 v:1,a:1 v:2,a:2" \
    -master_pl_name master.m3u8 \
    -strftime 1 \
    -f hls -hls_time 20 -hls_list_size 0 \
    -hls_segment_filename "${record_folder}/v%v/file-%Y%m%d-%%03d.ts" \
    "${record_folder}/v%v/index.m3u8"






