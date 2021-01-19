NAME=""
URL=""

while getopts "n:u:" opt; do
    case $opt in
        n)
            NAME=$OPTARG
            ;;
        u)
            URL=$OPTARG
            ;;
        \?)
            echo "Usage: cmd [-n]"
            ;;
    esac
done

curl --data-urlencode "name=${NAME}" $URL