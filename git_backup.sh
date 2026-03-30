#!/bin/bash

export HOME=/config
export GIT_SSH_COMMAND="ssh -i /config/.ssh/id_ed25519 -o UserKnownHostsFile=/config/.ssh/known_hosts"

cd /config || exit 1

echo "[$(date)] Starting backup"

git pull --rebase

if ! git diff --quiet; then
  git add .
  git commit -m "Auto backup $(date '+%Y-%m-%d %H:%M:%S')"
  git push
  echo "[$(date)] Changes pushed"
else
  echo "[$(date)] No changes"
fi
