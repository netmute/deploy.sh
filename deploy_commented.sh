#!/bin/bash

# SSH host to deploy to.
TARGET_HOST="simon@simonernst.com"

# Target directory on the SSH host.
TARGET_DIR="/var/www/simonernst"

echo Deploying...

# The bundle command. Replace this as you see fit.
# It should just result in a 'bundle.tgz'.
git archive -o bundle.tgz HEAD &&

# Copy bundle to the server.
scp -q bundle.tgz $TARGET_HOST:/tmp/ &&

# Delete local copy of bundle.
rm bundle.tgz &&

# Connect to the server and run commands.
ssh $TARGET_HOST 'bash -s' <<ENDSSH

  # Make sure the target directory exists and is empty.
  mkdir -p $TARGET_DIR && rm -rf $TARGET_DIR/*

  # Unpack the bundle to the target directory.
  tar xfzo /tmp/bundle.tgz -C $TARGET_DIR

  # Delete the bundle from the server.
  rm /tmp/bundle.tgz

ENDSSH
echo Done.