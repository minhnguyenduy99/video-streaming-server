const ffmpeg = require("ffmpeg");
const CONSTS = require("./consts");
const https = require("https");
const fs = require("fs");
const path = require("path");
const { exec } = require("child_process");

let argv = {
    key: ""
};

// Get the environment variables
process.argv.forEach((val) => {
    const [key, value] = val.split("=");
    key && value && (argv[key] = value);
});

const filePath = `${CONSTS.RECORD_PATH}/${argv.key}.flv`;

fs.mkdirSync(path.join(CONSTS.RECORD_PATH, key));

exec(`ffmpeg -i ${filePath} \
    -preset slow -g 48 -sc_threshold 0 \
    -hls_flags second_level_segment_index \
    -map 0:v -map 0:a -map 0:v -map 0:a -map 0:v -map 0:a \
    -c:v:0 libx264 -c:a:0 aac -b:v:0 512k  -b:a 32k  \
    -c:v:1 libx264 -c:a:1 aac -b:v:1 720k  -b:a 64k  \
    -c:v:2 libx264 -c:a:2 aac -b:v:2 1080K -b:a 128k \
    -var_stream_map "v:0,a:0 v:1,a:1 v:2,a:2" \
    -master_pl_name ${key}.m3u8 \
    -strftime 1 \
    -f hls -hls_time 20 -hls_list_size 0 \
    -hls_segment_filename "${CONSTS.RECORD_PATH}/v%v/file-%Y%m%d-%%03d.ts" \
    "${record_folder}/v%v/index.m3u8"
`, (err) => {
    console.log(err.message);
});


// upload files to S3


// delete recorded file


