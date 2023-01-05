#!/bin/bash -u

npm install firebase-tools
echo "export PATH=$(pwd)/node_modules/.bin:$PATH" >> "${BASH_ENV}"
