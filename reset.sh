#!/bin/bash

# Checkout the original branch
git checkout main

# Remove the output branch
git branch -d output

# Remove everything untracked
git clean -fd
