#!/bin/bash

# Based on info found here: https://github.com/tno-terminology-design/tev2-mve/blob/main/.github/workflows/deploy-docs.yml

# Create a new branch where we will store the output. This way we can keep the main branch clean.
git checkout -b output

# Run the TEv2 tools
cd docs
mrg-import -c garden-glossary-config.yaml
mrgt       -c garden-glossary-config.yaml
hrgt -f    -c garden-glossary-config.yaml
trrt -f    -c garden-glossary-config.yaml