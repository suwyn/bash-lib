#!/usr/bin/env bash

function Date.today {
  date +%Y-%m-%d
}

function Time.ago {
  local adjustment=$1 tz
  tz=$(date +%z)
  local formatted_tz="${tz:0:3}:${tz:3:5}"

  date -v"$adjustment" +%Y-%m-%dT%H:%M:%S"$formatted_tz"
}

function DateTime::Format.iso8601 {
  echo '%Y-%m-%dT%H:%M:%SZ'
}

# returns the current datetime
function DateTime.current {
  date -u +"$(DateTime::Format.iso8601)"
}

# returns the current datetime offset by the provided argument
# examples: "+1 seconds"
function DateTime.in {
  local offset=$1

  date --date="$offset" -u +"$(DateTime::Format.iso8601)"
}
