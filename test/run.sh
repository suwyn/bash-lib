#!/usr/bin/env bash

# shellcheck disable=SC1091

source "$BASH_LIBS/All.sh"

Specs::Run.start

source ./test/src/is_test.sh

Specs::Run.end
