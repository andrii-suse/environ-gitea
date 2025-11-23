set -e
org=$1
repo=$2

__workdir/curl_post "/api/v1/admin/users/$org/repos" '{"name":"'$repo'","private":false}'

echo "$org/$repo"

