#!/usr/bin/env bash

echo "Running pre-push hook"
./scripts/run-rubocop.sh

# $? stores exit value of the last command
if [ $? -ne 0 ]; then
 echo "Code must be clean before commiting"
 exit 1
fi

./scripts/run-tests.sh

# $? stores exit value of the last command
if [ $? -ne 0 ]; then
 echo "Tests must pass before pushing!"
 exit 1
fi
