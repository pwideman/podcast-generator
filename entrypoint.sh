#!/bin/bash

echo "==================="

git config --global user.name "${GITHUB_ACTOR}"
git config --global user.email "${INPUT_EMAIL}"
git config --global --add safe.directory /github/workspace

python3 /usr/bin/feed.py

if [[ -z $(git status -s) ]]; then
  echo "No changes to commit"
  exit 0
fi
git add -A && git commit -m "Update feed"
git push --set-upstream origin main

echo "==================="
