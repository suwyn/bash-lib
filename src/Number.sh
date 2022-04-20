#!/usr/bin/env bash

function Integer.valid {
  [[ "${1}" =~ ^[0-9]+$ ]]
}
