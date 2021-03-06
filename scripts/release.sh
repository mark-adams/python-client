#!/usr/bin/env bash
# This script updates the version for the ldclient library and releases it to PyPi
# It will only work if you have the proper credentials set up in ~/.pypirc

# It takes exactly one argument: the new version.
# It should be run from the root of this git repo like this:
#   ./scripts/release.sh 4.0.9

# When done you should commit and push the changes made.

set -uxe
echo "Starting python-client release."

VERSION=$1

#Update version in ldclient/version.py
echo "VERSION = \"${VERSION}\"" > ldclient/version.py

# Update version in setup.py
SETUP_PY_TEMP=./setup.py.tmp
sed "s/ldclient_version=.*/ldclient_version='${VERSION}'/g" setup.py > ${SETUP_PY_TEMP}
mv ${SETUP_PY_TEMP} setup.py

python setup.py sdist upload

echo "Done with python-client release"
