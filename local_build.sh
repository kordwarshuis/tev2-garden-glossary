#!/bin/bash

# Based on info found here: https://github.com/tno-terminology-design/tev2-mve/blob/main/.github/workflows/deploy-docs.yml

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