#!/bin/bash

# This entry script is needed to give cron access to the environment variables

printenv | sed 's/^\(.*\)$/export \1/g' > /usr/src/dumper/.env.sh
chmod +x /usr/src/dumper/.env.sh
chmod +x /usr/src/dumper/dumper_script.sh

cron -f