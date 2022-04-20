#!/usr/bin/env bash

function Regex.matches {
  local regex=$1
  local string=$2

  echo "$string" | grep -qE "$regex"
}
