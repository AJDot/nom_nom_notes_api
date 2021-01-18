#!/usr/bin/env bash

pushd .git/hooks
echo "Installing hooks..."
# this command creates symlink to our pre-commit script
ln -sv ../../scripts/pre-commit.rb pre-commit
ln -sv ../../scripts/pre-push.rb pre-push
ln -sv ../../scripts/commit-msg.rb commit-msg
echo "Done!"
popd
