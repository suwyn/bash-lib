#!/usr/bin/env bash

function Bash.version {
  bash_version=$(bash --version)
  [[ "$bash_version" =~ version[[:space:]]*([0-9]*\.[0-9]*) ]] &&
    echo "${BASH_REMATCH[1]}"
}

function Bash::Version.lt {
  local check=$1
  version=$(Bash.version)
  (($(echo "$version < $check" | bc -l)))
}
