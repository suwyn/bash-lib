#!/usr/bin/env bash

function Os.name {
  result="$(uname -s)"

  case "$(result)" in
    Linux*) machine=Linux ;;
    Darwin*) machine=Mac ;;
    CYGWIN*) machine=Cygwin ;;
    MINGW*) machine=MinGw ;;
    *) machine="UNKNOWN:$result" ;;
  esac

  echo "$machine"
}

function Os.is {
  name=$1
  String.match "$(Os.name)" "$name"
}
