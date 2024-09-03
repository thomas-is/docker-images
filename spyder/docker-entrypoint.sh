#!/bin/sh

RST="\033[0m\033m"
RED="\033[1;31m\033m"
GRN="\033[1;32m\033m"
ORG="\033[1;33m\033m"
BLU="\033[1;34m\033m"
PUR="\033[1;35m\033m"
CYN="\033[1;36m\033m"
GRY="\033[1;38m\033m"

info() {
  printf "[${BLU}info$RST] %s\n" "$@"
}
warn() {
  printf "[${ORG}warn$RST] %s\n" "$@"
}

info "begining of entrypoint"
info "end of entrypoint"
exec $@
