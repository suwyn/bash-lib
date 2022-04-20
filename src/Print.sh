#!/usr/bin/env bash

# https://misc.flogisoft.com/bash/tip_colors_and_formatting
function Print.colored {
  local color=$1 value_of_color
  if [[ -s /dev/stdin ]]; then
    text=$(< /dev/stdin)
  else
    text=${2:-}
  fi

  # NOTE: color_$_value convension prevents abritrary command execution
  local color_reset_value='\033[39m'
  local color_red_value='\033[31m'
  local color_green_value='\033[32m'
  local color_yellow_value='\033[33m'
  value_of_color=$(eval echo "\$color_${color}_value")
  echo -e "$value_of_color$text$color_reset_value"
}

function Print.highlight {
  Print.warning "$@"
}

function Print.success {
  Print.colored green "$@"
}

function Print.warning {
  Print.colored yellow "$@"
}

function Print.danger {
  Print.colored red "$@"
}

function Print.hr {
  printf '\n'
  printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
  printf '\n'
}
