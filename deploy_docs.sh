#!/bin/bash

set -x

# export REMOTE_URL=$(git remote get-url origin)

git init unimath-gh-pages

cp html/* unimath-gh-pages/

pushd unimath-gh-pages

export MESSAGE="Autoupdate coqdoc documentation from travis

Generated with 'make html'"

git add .
git commit -m "$MESSAGE"

git remote add origin git@github.com:abooij/UniMath # $REMOTE_URL

eval $(ssh-agent -s)

set +x
echo "Loading SSH private key..."
echo "$SSH_PRIVATE_KEY" | base64 -d | ssh-add -
set -x

git push -f origin HEAD:gh-pages

popd

set +x
