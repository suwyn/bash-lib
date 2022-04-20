#!/usr/bin/env bash

function Dir.exists {
  local dir_name=$1
  [ -d "${dir_name}" ]
}
