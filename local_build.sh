#!/bin/bash

# Based on info found here: https://github.com/tno-terminology-design/tev2-mve/blob/main/.github/workflows/deploy-docs.yml

# Checkout the original branch
git checkout main

# Remove the output branch
git branch -D output

# Create a new branch where we will store the output. This way we can keep the main branch clean.
git checkout -b output

# Run the TEv2 tools
cd docs

# This step is to be taken only if your documentation uses terms that are defined elswhere (e.g., in another repo). In other cases, it can safely be skipped.
# https://tno-terminology-design.github.io/tev2-mve/how-to/import-mrgs/
mrg-import -c garden-glossary-config.yaml

# https://tno-terminology-design.github.io/tev2-mve/how-to/generate-mrgs/
mrgt -c garden-glossary-config.yaml

# https://tno-terminology-design.github.io/tev2-mve/how-to/generate-hrgs/
hrgt -f -c garden-glossary-config.yaml

# https://tno-terminology-design.github.io/tev2-mve/how-to/resolve-termrefs/
trrt -f -c garden-glossary-config.yaml

trrt -f -c garden-glossary-config-specup.yaml


# Create a website based on the output of the TEv2 tools. In this case a MkDocs site.
# This command works by using git rev-parse --show-toplevel, which returns the root directory of the current Git repository. The $(...) syntax in bash executes the command inside the parentheses and replaces the $(...) with the command's output. So, cd $(git rev-parse --show-toplevel) changes the current directory to the root directory of the Git repository.
cd $(git rev-parse --show-toplevel)
mkdocs build


# Commit to the output branch
git add .
git commit -m "Commit to the output branch"
# git pull origin output
git push origin output --force
# git push origin output
