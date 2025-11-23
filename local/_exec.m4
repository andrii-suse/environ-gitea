mkdir -p __workdir/dt
__workdir/gen_env

test 1 != "${ENVIRON_GT_DB_AUTOSTART-1}" || __workdir/db/status >& /dev/null || __workdir/db/start "--transaction-isolation=read-committed"
[ -e __workdir/db/sql_test_gitea ] || __workdir/db/create_db test_gitea

(
    HOME=/usr/share/gitea GITEA_CUSTOM=/usr/share/gitea GITEA_WORK_DIR=__workdir gitea web -c __workdir/app.ini --verbose >> __workdir/.cout 2>> __workdir/.cerr &
    pid=$!
    echo $pid > __workdir/.pid
)
sleep 0.1
__workdir/status || sleep 0.1
__workdir/status || sleep 0.2
__workdir/status || sleep 0.3
__workdir/status || sleep 0.4
__workdir/status || sleep 0.5
__workdir/status || sleep 0.7
__workdir/status || sleep 1
__workdir/status || sleep 2
