#!/usr/bin/env bash

# Make sure folders exist
mkdir -p /etc/service.d
mkdir -p /etc/runit/init.d
mkdir -p /etc/runit/finish.d

# Make sure init and finish scripts are runnables
find /etc/runit/init.d -name '*.sh' -type f -exec chmod a+x {} \;
find /etc/runit/finish.d -name '*.sh' -type f -exec chmod a+x {} \;

# Give acces to the current user
if [[ -n "$USER" ]]; then
    chown -R "${NEW_USER}:${NEW_GROUP}" /etc/service.d
fi