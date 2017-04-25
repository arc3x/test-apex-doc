#!/bin/bash

set -o errexit -o nounset

if [ "$TRAVIS_BRANCH" != "master" ]
then
  echo "This commit was made against the $TRAVIS_BRANCH and not the master! No deploy!"
  exit 0
fi

rev=$(git rev-parse --short HEAD)

cd documentation/ApexDocumentation

git init
git config user.name "RedTeal - Autodoc"
git config user.email "admin@redteal.com"

git remote add upstream "https://$GH_TOKEN@github.com/$TRAVIS_REPO_SLUG.git"
git fetch upstream
git reset upstream/gh-pages

# echo "test.com" > CNAME

touch .

git add -A .
git commit -m "rebuild pages at ${rev}"
git push -q upstream HEAD:gh-pages
