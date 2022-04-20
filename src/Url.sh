#!/usr/bin/env bash

function Url.valid {
  [[ "${1}" =~ ^http(s)*://[^.]+\.[^.]+ ]]
}
