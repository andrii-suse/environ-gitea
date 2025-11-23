set -e

__workdir/../create_user alice "$(cat __workdir/password.txt)"
__workdir/../create_token alice "$(cat __workdir/password.txt)" > __workdir/token.txt
