# environ-gitea

[![](https://github.com/andrii-suse/environ-gitea/actions/workflows/test.yml/badge.svg?branch=main)](https://github.com/andrii-suse/environ-gitea/actions/workflows/test.yml/badge.svg?branch%3Amain "main")

## Purpose

Easy setup and manage local gitea instance for manual or automated testing.
The goal is a simple way to add required functionality without requiring complex libraries. (See #Troubleshooting)
All processes are run under current user: no sudo required. This also means that no residues are left in the system after the instance is deleted.

## Prerequisites

All required dependancies must be installed separately. The environ framework doesn't attempt to manage dependancies of gitea binaries or build prerequisites.

## Limitations

Currently works only with MariaDB backend, so you must have MariaDB server installed.
Requires environ scritps (check #Installation)
Check also section Hacks

## Synopsis

Environ framework creates special folders to spawn and manage selected services:

    gt=$(environ gt)
    # start instance
    $gt/start
    $gt/status
    # create admin user
    $gt/admin/create
    # create preconfigured user bob
    $gt/bob/create
    # create an organisation for user bob
    $gt/admin/create_org bob MyOrg
    # create a repo for that organization
    $gt/admin/create_repo MyOrg MyRepo
    # browse the repo files
    ls -la $dt/dt/repos/myorg/myrepo.git
    # check database content
    $gt/db/sql 'select * from repository'
    # wipe out old instance and create new one
    gt=$(environ gt)


## Spawn environ from source code tree

    git clone https://github.com/go-gitea/gitea ~/mygiteasrc
    ( cd ~/mygiteasrc && go build )
    gt=$(environ gt ~/mygiteasrc)

## Spawn several environs

Environ framework allows easily compare behavior of different builds

    # use binaries built in folder ~/mygiteasrc
    gt1=$(environ gt1 ~/mygiteasrc)
    $gt1/start

    # use binaries built in folder ~/mygiteasrc2
    gt2=$(environ gt2 ~/mygiteasrc2)
    $gt2/start

    # use binaries installed in system
    gtsystem=$(environ gt3)
    $gtsystem/start

## Create custom user

    $gt/create_user myuser mypassw
    $gt/create_token myuser mypassw

## Troubleshooting

All the commands above are one or few lines wrappers around official gitea api or commands.
Just check content of corresponding shell script. 
You can use bash debugging capabilities and add `set +x` at the top of problem generated scripts to see all the details.

## Installation from source

You must have both environ and environ-gitea sources and run `sudo make install` in both
No special prerequisites are required except bash and m4, both should be available in most of environments

## Installation with packages

Install environ and environ-gitea packages from https://download.opensuse.org/repositories/home:/andriinikitin:/environ/
For inspiration check test container setup in t/lib/Dockerfile.environ.mariadb

# Hacks

Currently gitea packages may have too strict configuration and do not allow the binary to be spawned as regular user.
Check scripts in hacks folder to work around it:

	01-aa-disable.sh # disable AppArmor for gitea package
	02-chown.sh      # let regular user see content in preinstalled gitea 
