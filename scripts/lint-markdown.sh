#!/bin/bash
# Wrapper script to handle markdownlint installation and execution
FILES=$1

if ! command -v markdownlint &> /dev/null; then
  echo "Installing markdownlint..."
  npm install -g markdownlint-cli
fi

markdownlint "$FILES"
exit $?
