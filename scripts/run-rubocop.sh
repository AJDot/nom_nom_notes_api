#!/usr/bin/env bash

set -e

cd "${0%/*}/.."

if hash bundle
then
  if hash rubocop
  then
    echo "Running rubocop"
    bundle exec rubocop
  fi
fi
