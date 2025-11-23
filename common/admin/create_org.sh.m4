set -e
user=$1
org=$2

__workdir/curl_post "/api/v1/admin/users/$user/orgs" '{"username": "'$org'"}'
