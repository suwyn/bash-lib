#!/usr/bin/env bash

# references
# * https://www.lukeshu.com/blog/bash-arrays.html
# * https://www.thegeekstuff.com/2010/06/bash-array-tutorial
function Array.join {
  local delim=$1
  shift
  local IFS="$delim"
  echo "$*"
}
