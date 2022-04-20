#!/usr/bin/env bash

function String.append {
  local text=$1
  local string=$2
  echo "$text" | while read -r line; do printf '%s\t%s\n' "$line" "$string"; done
}

function String.slugify {
  if Shell.has_stdin; then
    data=$(cat -)
  else
    data="$1"
  fi

  data=$(echo "$data" | tr [A-Z] [a-z] | tr '-' ' ' | tr -d '[:punct:]')
  data=$(echo "$data" | tr -d '[:digit:]')

  data=${data// as / }
  data=${data// a / }
  data=${data// so / }
  data=${data// that / }
  data=${data// how / }
  data=${data// i / }
  data=${data// can / }
  data=${data// me / }
  data=${data// my / }
  data=${data// with / }
  data=${data// and / }
  data=${data// in / }
  data=${data// is / }
  data=${data// it / }
  data=${data// do / }
  data=${data// to / }
  data=${data// the / }
  data=$(echo "$data" | sed -E 's/ +/-/g')

  echo "$data" | tr ' ' '-' | rev | cut -d'-' -f -5 | rev
}

function String.escape {
  data=$1
  data=${data//\\/\\\\} # \
  data=${data//\//\\\/} # /
  data=${data//\"/\\\"} # "
  data=${data//   /\\t} # \t (tab)
  data=${data//
/\\\n} # \n (newline)
  data=${data//^M/\\\r} # \r (carriage return)
  data=${data//^L/\\\f} # \f (form feed)
  data=${data//^H/\\\b} # \b (backspace)
  echo "$data"
}

function String.escape_newline {
  data=$1
  data=${data//
/\\\n} # \n (newline)
  echo "$data"
}

function String.lower {
  if Shell.has_stdin; then
    input=$(cat -)
  else
    input="$1"
  fi
  echo "$input" | tr '[:upper:]' '[:lower:]'
}

function String.upper {
  echo "${1^^}"
}

function String.encode {
  local string="${1:-}"
  local strlen=${#string}
  local encoded=""
  local pos c o

  for ((pos = 0; pos < strlen; pos++)); do
    c=${string:$pos:1}
    case "$c" in
      [-_.~a-zA-Z0-9])
        o="${c}"
      ;;
      *)
        printf -v o '%%%02x' "'$c"
      ;;
    esac
    encoded+="${o}"
  done
  echo "${encoded}"
}

function String.insenstive_match {
  grep -qi "$1" <<< "$2"
}

function String.match {
  grep -q "$1" <<< "$2"
}

function String.casecmp {
  Is.eq "$(String.ucase "$1")" "$(String.ucase "$2")"
}

function String.blank {
  [ -z "${1-}" ]
}

function Word.in {
  local string=$1
  local list=$2
  grep -wi "$string" <<< "$list" > /dev/null
}

function String.is_in {
  local value=$1
  shift
  local array=("$@")

  [[ " ${array[@]} " =~ " ${value} " ]]
}

function String.blank {
  [ -z "${1-}" ]
}

function String.present {
  [ -n "${1-}" ]
}

function String.replace {
  string="$1"
  match="$2"
  replace="$3"

  echo "${string//$match/$replace}"
}

function String.trim {
  if Shell.has_stdin; then
    input=$(cat -)
  else
    input="$1"
  fi

  echo "$input" | xargs
}

function String.contains {
  local string=$1
  local match=$2

  [[ "$string" == *"$match"* ]]
}

function String.escape_newline {
  data=$1
  data=${data//
/\\\n} # \n (newline)
  echo "$data"
}
