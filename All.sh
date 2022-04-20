#!/usr/bin/env bash

# source all the BASH LIB packages
# BASH_LIBS must be defined and pointed to this project's root folder
# export BASH_LIBS=path/to/bash-libs

# Add `source "$BASH_LIBS/All.sh"` to your bash script

for file in "$BASH_LIBS"/src/*.sh; do
  # shellcheck source=/dev/null
  . "$file"
done
