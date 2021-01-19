stream_name=""
host=""
app=""

while getopts "host:source:name" opt; do
    case $opt in
        host)
            host="rtmp://${OPTARG}"
            ;;
        source)
            source="rtmp://${OPTARG}"
            ;;
        name)
            stream_name=$OPTARG
            ;;
        \?)
            echo "Usage: cmd [-host] [-source] [-name]"
            ;;
    esac
done


ffmpeg -i "${host}/${name}"
    -c:a aac -b:a 32k  -c:v libx264 -b:v 512K  -preset veryfast -f flv "${source}/${name}_low"
    -c:a aac -b:a 64k  -c:v libx264 -b:v 720K  -preset veryfast -f flv "${source}/${name}_mid"
    -c:a aac -b:a 128k -c:v libx264 -b:v 1080K -preset veryfast -f flv "${source}/${name}_high"