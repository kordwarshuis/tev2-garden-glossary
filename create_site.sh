#!/bin/bash

# Based on info found here: https://github.com/tno-terminology-design/tev2-mve/blob/main/.github/workflows/deploy-docs.yml

# Create a website based on the output of the TEv2 tools. In this case a MkDocs site.

# This command works by using git rev-parse --show-toplevel, which returns the root directory of the current Git repository. The $(...) syntax in bash executes the command inside the parentheses and replaces the $(...) with the command's output. So, cd $(git rev-parse --show-toplevel) changes the current directory to the root directory of the Git repository.
cd $(git rev-parse --show-toplevel)
mkdocs build
