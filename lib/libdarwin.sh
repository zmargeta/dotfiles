#!/bin/bash

get_homebrew_prefix() {
  if [[ "$(uname -m)" == "arm64" ]]; then
    printf '/opt/homebrew'
  else
    printf '/usr/local'
  fi
}

find_homebrew() {
  DOT_HOMEBREW="$(command -v brew)"
  if [[ -z "${DOT_HOMEBREW}" ]]; then
    DOT_HOMEBREW="$(get_homebrew_prefix)/bin/brew"
  fi
  readonly DOT_HOMEBREW
  if [[ ! -f "${DOT_HOMEBREW}" ]]; then
    return 1
  fi
  readonly DOT_HOMEBREW_PREFIX="$("${DOT_HOMEBREW}" --prefix)"
  return 0
}
