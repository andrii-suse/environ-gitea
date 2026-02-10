HOME=__workdir GITEA_CUSTOM=__workdir GITEA_WORK_DIR=__workdir gitea actions generate-runner-token -c __workdir/app.ini 2>/dev/null | tail -n 1
