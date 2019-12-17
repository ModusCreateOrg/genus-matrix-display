#!/usr/bin/env bash
#
# install.sh
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

git clone --single-branch --branch rgb-display  git@github.com:ModusCreateOrg/genus.git
git clone --single-branch --branch rgb-display git@github.com:ModusCreateOrg/creative-engine.git

cd genus/
ln -s ../creative-engine ./creative-engine
cd ..

echo "Next step is to execute ./make-genus-build.sh"
