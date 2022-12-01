#!/bin/bash

set -e

for f in /docker-entrypoint.d/*.sh; do
    echo "Running $f"
    "$f"
done

if [ -d /docker-custom-entrypoint.d/ ]; then
    find /docker-custom-entrypoint.d/ -type f -name "*.sh" \
        -exec chmod +x {} \;
    sync
    find /docker-custom-entrypoint.d/ -type f -name "*.sh" \
        -exec echo Running {} \; -exec {} \;
fi

exec /usr/sbin/cron -f & 
exec /usr/local/bin/r10k-deploy.sh & 
exec /opt/puppetlabs/bin/puppetserver "$@"
