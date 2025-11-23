set -e

__workdir/../create_admin admin "$(cat __workdir/password.txt)"
__workdir/../create_token admin "$(cat __workdir/password.txt)" > __workdir/token.txt
