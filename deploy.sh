#!/bin/bash

APP_NAME="deploy_sh"
SSH_HOST="user@example.com"
APP_DIR="/var/www/$APP_NAME"

BUNDLE_CMD="git archive -o bundle.tgz HEAD"

echo Deploying...
$BUNDLE_CMD > /dev/null 2>&1 &&
scp bundle.tgz $SSH_HOST:/tmp/ > /dev/null 2>&1 &&
rm bundle.tgz > /dev/null 2>&1 &&
ssh $SSH_HOST 'bash -s' > /dev/null 2>&1 <<ENDSSH
if [ ! -d "$APP_DIR" ]; then
  mkdir -p $APP_DIR
else
  rm -rf $APP_DIR/*
fi
pushd $APP_DIR
  tar xfz /tmp/bundle.tgz -C $APP_DIR
  rm /tmp/bundle.tgz
popd
ENDSSH
echo Done.
