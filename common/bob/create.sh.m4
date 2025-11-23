set -e

__workdir/../create_user bob "$(cat __workdir/password.txt)"
__workdir/../create_token bob "$(cat __workdir/password.txt)" > __workdir/token.txt
