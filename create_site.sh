#!/bin/bash

# Based on info found here: https://github.com/tno-terminology-design/tev2-mve/blob/main/.github/workflows/deploy-docs.yml

# Create a website based on the output of the TEv2 tools. In this case a MkDocs site.

cd /
mkdocs build
