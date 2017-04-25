# Demo of CI for Apex Documentation Generation

## Setup
1. Activate the github repo on travisci
1. Generate a personal access token [here](https://github.com/settings/tokens)
 1. with full repo scope, but nothing else
1. Follow the documentation [here](https://docs.travis-ci.com/user/encryption-keys/) to encrypt and set your secret in .travis.yml
1. Edit scripts/document.sh
 1. change -s to point to the source directory of your class files
 1. change -g to point at where your code is hosted (github)(for documentation to source code link)
