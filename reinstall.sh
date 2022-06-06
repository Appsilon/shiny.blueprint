#!/bin/sh
set -eu

# Install the JavaScript dependencies
yarn --cwd js

# Bundle the JavaScript code into a single file
yarn --cwd js webpack

# Generate the NAMESPACE file and documentation
Rscript -e 'devtools::document()'

# Install the package
Rscript -e 'devtools::install()'
