uri=$1
data=$2

# set -x

curl -s -X POST \
     -H "Authorization: token $(cat __workdir/token.txt)" \
     -H "Content-type: application/json" \
     --fail-with-body \
     -d "$data" \
     127.0.0.1:__port/$uri

