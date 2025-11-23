set -e
[ -e __workdir/app.ini ] || (


echo "

[database]
DB_TYPE = mysql
HOST = __workdir/db/.sock
NAME = test_gitea
USER = __user
SCHEMA = test_gitea
SSL_MODE = disable
PATH = __gitea/dt/gitea.db
LOG_SQL = true

[repository]
ROOT = __workdir/dt/repos

[server]
; SSH_DOMAIN = 127.0.0.1
DOMAIN = 127.0.0.1
HTTP_PORT = __port
ROOT_URL = http://127.0.0.1:__port/
APP_DATA_PATH = __workdir/dt
DISABLE_SSH = true
LFS_START_SERVER = false
OFFLINE_MODE = true
SSH_ROOT_PATH = __workdir/
SSH_CREATE_AUTHORIZED_KEYS_FILE = false
SSH_CREATE_AUTHORIZED_PRINCIPALS_FILE = false

[lfs]
PATH = __workdir/dt/lfs

[mailer]
ENABLED = false

[service]
REGISTER_EMAIL_CONFIRM = false
ENABLE_NOTIFY_MAIL = false
DISABLE_REGISTRATION = false
ALLOW_ONLY_EXTERNAL_REGISTRATION = false
ENABLE_CAPTCHA = false
REQUIRE_SIGNIN_VIEW = false
DEFAULT_KEEP_EMAIL_PRIVATE = false
DEFAULT_ALLOW_CREATE_ORGANIZATION = true
DEFAULT_ENABLE_TIMETRACKING = true
NO_REPLY_ADDRESS = noreply.localhost
ENABLE_BASIC_AUTHENTICATION = true

[openid]
ENABLE_OPENID_SIGNIN = true
ENABLE_OPENID_SIGNUP = true

[cron.update_checker]
ENABLED = false

[session]
PROVIDER = file

[log]
MODE = console
LEVEL = info
ROOT_PATH = __workdir/log

[repository.pull-request]
DEFAULT_MERGE_STYLE = merge

[repository.signing]
DEFAULT_TRUST_MODEL = committer

[security]
INSTALL_LOCK = true
INTERNAL_TOKEN = eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYmYiOjE3NDg1NTQ3NTF9.p9P-b34KjefKjOcwrqVSNhk10ia5C2u88LUiD6KPDnw
PASSWORD_HASH_ALGO = pbkdf2

[oauth2]
JWT_SECRET = RLIhKOGfF70gdPr4a6m8ypSk27EqFMHzItVWE9s5L3M
"

) > __workdir/app.ini

#    for i in "$@"; do
#        [ -z "$i" ] || echo "export $i" >> __workdir/conf.env
#    done
