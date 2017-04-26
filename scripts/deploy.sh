#!/bin/bash

set -o errexit -o nounset

rev=$(git rev-parse --short HEAD)

cd documentation/ApexDocumentation

# git init
# git config user.name "RedTeal - Autodoc"
# git config user.email "admin@redteal.com"
#
# git remote add upstream "https://${GH_TOKEN}@github.com/test-apex-doc.git"
# git fetch upstream
# git reset upstream/gh-pages

# echo "test.com" > CNAME
git branch -vv
git fetch origin/gh-pages
git reset origin/gh-pages
git checkout gh-pages

touch .

git add -A .
git commit -m "rebuild pages at ${rev}"
git push -q upstream HEAD:gh-pages
