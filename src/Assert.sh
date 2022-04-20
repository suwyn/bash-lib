#!/usr/bin/env bash

function Specs::Run.start {
  export SPEC_SUCCESS_COUNT=0
  export SPEC_FAILURE_COUNT=0
}

function Specs::Run.end {
  echo "Passed: $SPEC_SUCCESS_COUNT Failed: $SPEC_FAILURE_COUNT"
  if [ "$SPEC_FAILURE_COUNT" -gt 0 ]
  then
    exit 1
  fi
}

function Assert.eq {
  read -r -t 0.1 desc
  local failure=''

  if ! Is.eq "$1" "$2"
  then
    failure="Expected $1 to equal $2"
  fi

  Specs::Print.__result "$desc" "$failure"
}

function Assert.true {
  read -r -t 0.1 desc
  local failure=''

  if ! eval "$*"; then
    failure='Expected true was false'
  fi

  Specs::Print.__result "$desc" "$failure"
}

function Assert.false {
  read -r -t 0.1 desc
  local failure=''

  if eval "$*"; then
    failure='Expected false was true'
  fi

  Specs::Print.__result "$desc" "$failure"
}

# PRIVATE

function Specs::Print.__result {
  local desc=$1 failure=$2

  if String.present "$failure"
  then
    ((SPEC_FAILURE_COUNT+=1))
    printf "%s %s\n" '✗' "$desc"
    printf "\t%s\n" "$failure"
  else
    ((SPEC_SUCCESS_COUNT+=1))
    printf "%s %s\n" '✓' "$desc"
  fi
}
