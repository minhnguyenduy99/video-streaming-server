RECORD_FOLDER_DIR=/nginx-streaming-server/tmp/record
bucket="qwstream-nginx-storages"
name=""
file_path=""

while getopts "n:" opt; do
    case $opt in
        n)
            echo $OPTARG
            file_path="${RECORD_FOLDER_DIR}/${OPTARG}.flv"
            name="${OPTARG}"
            # If the stream is not in record mode
            if [ ! -e $file_path ] 
            then
                exit 0
            fi
            ;;
    esac
done

new_file_path="${RECORD_FOLDER_DIR}/${name}.mp4"
file_path_upload_key="${name}/${name}.mp4"

ffmpeg -i $file_path -codec copy $new_file_path

curl -o - -X PUT -T "${new_file_path}" \
  https://${bucket}.s3.amazonaws.com/${file_path_upload_key}

rm $new_file_path
rm $file_path
  