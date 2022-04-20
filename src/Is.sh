#!/usr/bin/env bash

function Is.eq {
  [ "$1" == "$2" ]
}

function Is.undefined {
  [ -z "${!1+x}" ]
}

function Is.defined {
  [ -n "${!1+x}" ]
}
