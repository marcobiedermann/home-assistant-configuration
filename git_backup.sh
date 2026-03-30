#!/bin/bash

cd /config || exit 1

git pull --rebase

if ! git diff --quiet; then
  git add .
  git commit -m "Auto backup $(date '+%Y-%m-%d %H:%M:%S')"
  git push
fi
