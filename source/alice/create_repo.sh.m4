repo=${1:MyRepo}
__workdir/curl_post "/api/v1/repos" '{"name":'$repo',"private":false}'
echo $repo
