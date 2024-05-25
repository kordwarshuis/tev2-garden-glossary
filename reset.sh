#!/bin/bash

# Checkout the original branch
git checkout main

# Remove the output branch
git branch -D output

# Back to the main branch original starting pointå
# git reset --hard

# Remove everything untracked
# git clean -fd
