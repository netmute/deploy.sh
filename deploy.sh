#!/bin/bash

TARGET_HOST="simon@simonernst.com"
TARGET_DIR="/var/www/simonernst"

echo Deploying...
git archive -o bundle.tgz HEAD &&
scp -q bundle.tgz $TARGET_HOST:/tmp/ &&
rm bundle.tgz &&
ssh $TARGET_HOST 'bash -s' <<ENDSSH
  mkdir -p $TARGET_DIR && rm -rf $TARGET_DIR/*
  tar xfzo /tmp/bundle.tgz -C $TARGET_DIR
  rm /tmp/bundle.tgz
ENDSSH
echo Done.