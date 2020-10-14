#!/usr/bin/env sh

echo '[info]: Configuring container for development'
apk add make
echo '[info]: Installing development dependencies'
cp package.json -f ../
cd ../
npm install --also=dev && cd ./app
export PATH=$PATH:/usr/src/node_modules/.bin
echo '[info]: Developent environment configured.'