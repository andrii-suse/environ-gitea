uri=$1
# set -x

curl -s -H "Authorization: token $(cat __workdir/token.txt)" \
     -H "Content-type: application/json" \
     --fail-with-body \
     127.0.0.1:__port$uri

