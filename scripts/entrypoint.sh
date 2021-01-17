#!/bin/bash
export PATH="$PATH_ADD:$PATH"
cd "${1}"
exec "${@:2}"
