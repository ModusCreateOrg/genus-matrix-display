#!/usr/bin/env bash
#
# make-genus-build.sh
#
# Downloads and installs the required project files

# Set bash unofficial strict mode http://redsymbol.net/articles/unofficial-bash-strict-mode/
set -euo pipefail
IFS=$'\n\t'

# Set DEBUG to true for enhanced debugging: run prefixed with "DEBUG=true"
${DEBUG:-false} && set -vx

# Credit to https://stackoverflow.com/a/17805088
# and http://wiki.bash-hackers.org/scripting/debuggingtips
export PS4='+(${BASH_SOURCE}:${LINENO}): ${FUNCNAME[0]:+${FUNCNAME[0]}(): }'

# Credit to http://stackoverflow.com/a/246128/424301
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
BASE_DIR="$DIR/.."

#! /bin/sh
set CE_DIRECT_LINUX_CONTROS_ENABLED=true
set CE_NETWORK_DISPLAY_ENABLED=true


rm -rf build/ 2>/dev/null

mkdir -p build/

cd build

cmake ../genus/

## Use 4 cores to compile
make -j 4

./Genus

