#!/bin/bash

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
