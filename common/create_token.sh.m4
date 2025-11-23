set -e

user="$1"

password="$2"

__workdir/curl /api/v1/users/$user/tokens -H "Content-Type: application/json" -d '{"name":"test_token","scopes":["all"]}' -u "$user:$password" | grep -oE '"sha1":"[^"]{40}' | grep -oE '[^"]{40}'


