#!/bin/bash
set -eu

# Install the JavaScript dependencies
cd js
yarn

# Bundle the JavaScript code into a single file
yarn webpack
cd ..

# Generate the NAMESPACE file and documentation
Rscript -e 'devtools::document()'

# Install the package
Rscript -e 'devtools::install()'
