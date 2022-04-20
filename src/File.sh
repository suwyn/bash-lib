#!/usr/bin/env bash

function File.date {
  if [[ $(uname) == Darwin ]] ; then
    stat -f "%Sm" -t "%s" "$1"
  else
    date -r "$1" +%s
  fi
}

# TODO: rename this, it's specific to parsing a story, not any file
function File.parse {
  file=$1
  story=$(cat "$file")
  name=$(echo "$story" | head -1)
  name=${name#*## }
  description=$(echo "$story" | tail -n +2)
  cat <<EOM
{
  "name": "$(String.escape "$name")",
  "description": "$(String.escape "$description")"
}
EOM
}

function File.write {
  tmpfile=$1
  markdown=$2
  echo "${markdown}" > "$tmpfile"
  File.date "$tmpfile"
}

function File::Temp.create {
  # --suffix isn't available on osx, so doing it a hacky way
  prefix=$1
  extension=$2
  temp_file_prefix=$(mktemp "${TMPDIR:-/tmp/}${prefix}.XXX")
  rm "${temp_file_prefix}"
  mktemp "${temp_file_prefix}.XXX.${extension}"
}
