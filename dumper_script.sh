#!/bin/bash

# Load in env variables
source "/usr/src/dumper/.env.sh"

# Remove the previous dump and export a new one
rm dump.json || true && mongoexport --out=static/dump.json --collection=articles --uri=${MONGO_URL}
