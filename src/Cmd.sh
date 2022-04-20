#!/usr/bin/env bash

function Cmd.exists {
  command -v "$1" >/dev/null 2>&1
}
