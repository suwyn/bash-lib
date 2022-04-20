#!/usr/bin/env bash

function Shell.open {
  if Shell.has_stdin; then
    url=$(cat -)
  else
    url="$1"
  fi

  if [[ $(uname) == Darwin ]] ; then
    open=open
  else
    open=xdg-open
  fi
  "$open" "$url"
}

function Shell.has_stdin {
  [ -p /dev/stdin ]
}

function Shell.capture_input {
  if Shell.has_stdin; then
    input=$(cat -)
  else
    input="$1"
  fi

  echo "$input"
}

function Shell.current {
  if Cmd.exists dscl; then
    # https://stackoverflow.com/questions/16375519/how-to-get-default-shell
    # Mac's default shells are /bin/zsh or /bin/bash on older machines
    # homebrew installs to /usr/local/bin/zsh or /usr/local/bin/bash and these checks are agnostic
    dscl . -read ~/ UserShell | sed 's/UserShell: //' | xargs basename
  else
    echo "$SHELL" | xargs basename
  fi
}

# https://unix.stackexchange.com/questions/26576/how-to-delete-line-with-echo
# added \r to return cursor to begining of line
function Shell::Reset.line {
  echo -en "\033[1K\r"
}
