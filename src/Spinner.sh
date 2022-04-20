#!/usr/bin/env bash

function Spinner.start {
  text=${1:-}
  if ! String.blank "$text"; then
    Oso.print "$text  " no_break
  fi
  Spinner._animate &
  OSO_SPINNER_PID=$!
}

function Spinner._animate {
  local spinner='⣿⣷⣯⣟⡿⢿⣻⣽⣾'
  while :; do
    for i in $(seq 0 8); do
      echo -en "\010${spinner:$i:1}"
      sleep .1
    done
  done
}

function Spinner.stop {
  kill "$OSO_SPINNER_PID" >/dev/null 2>&1
  Shell::Reset.line
  echo -en "\033[1K\r"
}
