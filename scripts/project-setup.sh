#!/bin/sh

# Script to configure SwiftLint + GitHooks

# Directories
GIT_ROOT=$(git rev-parse --show-toplevel)
SCRIPTS_DIRECTORY=$GIT_ROOT/scripts
GIT_HOOKS_DIRECTORY=$SCRIPTS_DIRECTORY/git-hooks

# # -- 1 -- Linking `.swiftLint.yml`
# echo "1. Linking .swiftlint.yml:"
# ln -sf $SCRIPTS_DIRECTORY/.swiftlint.yml $GIT_ROOT/swiftlint.yml 

# if [[ $? != 0 ]] ; then
# echo ".swiftlint.yml moving failed"
# else 
# echo ".swiftlint.yml moved successfully"
# fi

# -- 2 -- Reassigning hooks
echo "2. Reassigning Git Hooks:"
git config core.hooksPath $GIT_HOOKS_DIRECTORY
chmod +x $GIT_HOOKS_DIRECTORY/*
echo "Hooks successfully reassigned to '$GIT_HOOKS_DIRECTORY'"