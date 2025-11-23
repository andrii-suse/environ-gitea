#!lib/test-in-container-environ.sh
set -exo pipefail

gt=$(environ gt)

$gt/start
$gt/status

$gt/curl -Is / | grep 200
curl -Is $($gt/print_address) | grep 200


# create user Admin
$gt/admin/create
$gt/bob/create

$gt/bob/ping
$gt/admin/ping

$gt/stop
$gt/start

$gt/admin/ping
$gt/admin/create_org bob MyOrg
$gt/admin/create_repo MyOrg MyRepo

find $gt | grep -i MyRepo | grep -i MyOrg | head -n 1

$gt/stop

echo success
