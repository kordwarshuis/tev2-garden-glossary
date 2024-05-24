#!/bin/bash

# Based on info found here: https://github.com/tno-terminology-design/tev2-mve/blob/main/.github/workflows/deploy-docs.yml

# Install mkdocs, mkdocs-material, pymdown-extensions, and pygments.
python -m pip install --upgrade pip
pip install mkdocs mkdocs-material pymdown-extensions pygments
