#!/bin/sh

# Configures a Repl.it environment
# Usage: . ./bin/setup-replit.sh

echo '[info]: Configure $PATH to include npm bin for Node override'
export PATH=$(npm bin):$PATH

echo '[info]: Installing Node.js 14'
npm install node@14
node --version

echo '[info]: Installing Doppler CLI'
wget https://github.com/DopplerHQ/cli/releases/download/3.16.0/doppler_3.16.0_linux_amd64.tar.gz
tar -xzf doppler_3.16.0_linux_amd64.tar.gz
rm doppler_3.16.0_linux_amd64.tar.gz
chmod +x doppler
mv doppler $(npm bin)
doppler --version

echo '[info]: Installing Node dependencies'
npm install

echo '[info]: Configuring Doppler'
echo '[info]: Create your free Doppler account at https://dashboard.doppler.com/register'
read -p 'Enter Doppler Service Token for yodaspeak project: ' doppler_token
doppler setup --silent --token $doppler_token
doppler configs

echo '[info]: Repl.it configured!'
echo '[info]: Starting the server with command `doppler run -- npm start`'
