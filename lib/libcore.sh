#!/bin/bash

readonly ESC='\x1B'
readonly ESC_INFO_ICON="${ESC}[1;34m"
readonly ESC_SUCC_ICON="${ESC}[1;32m"
readonly ESC_FAIL_ICON="${ESC}[1;31m"
readonly ESC_FAIL_TEXT="${ESC}[31m"
readonly ESC_WAIT_ICON="${ESC}[1;34m"
readonly ESC_LOUT_ICON="${ESC}[1;90m"
readonly ESC_INPT_ICON="${ESC}[1;34m"
readonly ESC_LOUT_TEXT="${ESC}[1;90m"
readonly ESC_BOLD="${ESC}[1m"
readonly ESC_RSTA="${ESC}[0m"
readonly ESC_CEL2="${ESC}[2K"
readonly ESC_CNL1="${ESC}[1E"
readonly ESC_CPL1="${ESC}[1F"
readonly LOG_INT_PRE='→'
readonly LOG_EXT_PRE='>'

cpln() {
  printf "${ESC_CEL2}\r${ESC_CPL1}${ESC_CEL2}\r"
}

info() {
  if [[ -n "$*" ]]; then
    log "$*"
    printf "${ESC_INFO_ICON}${LOG_INT_PRE}${ESC_RSTA} %s\n" "$*"
  fi
}

succ() {
  if [[ -n "$*" ]]; then
    log "$*"
    printf "${ESC_SUCC_ICON}${LOG_INT_PRE}${ESC_RSTA} %s\n" "$*"
  fi
}

fail() {
  if [[ -n "$*" ]]; then
    log "$*"
    printf "${ESC_FAIL_ICON}${LOG_INT_PRE}${ESC_RSTA} %s\n" "$*" >&2
  fi
}

wait_strt() {
  if [[ -n "$*" ]]; then
    loop() {
      local as=('⠦' '⠖' '⠲' '⠴')
      local bs=('⠦' '⠖' '⠲' '⠴')
      local p_line="$*"
      while true; do
        for (( i = 0; i < ${#as[@]}; i++ )); do
          printf "${ESC_CEL2}\r${ESC_WAIT_ICON}%s${ESC_RSTA} %s" "${as[i]}" "$*"
          if [[ -n "${DOT_WAIT_FLT}" ]]; then
            local c_icon="${LOG_EXT_PRE}"
            local c_line="$(norm3l)"
            if [[ -n "${c_line}" ]]; then
              p_line="${c_line}"
            else
              c_line="${p_line}"
            fi
            if [[ "${c_line}" == "$*" ]]; then
              c_icon="${bs[i]}"
              c_line='Starting up'
            fi
            printf "\n${ESC_CEL2}\r${ESC_LOUT_ICON}%s${ESC_LOUT_TEXT} %s${ESC_RSTA}${ESC_CPL1}" "${c_icon}" "${c_line}"
          fi
          sleep 0.1875
        done
      done
    }
    set +m
    log "$*"
    loop "$*" & 2> /dev/null
    DOT_WAIT_PID=$!
    unset -f loop
  fi
}

norm3l() {
  local IFS=$'\r'
  read -r -a sub_lines <<< "$(tail -n 1 "${DOT_LOGFILE}" | expand)"
  echo "${sub_lines[@]: -1:1}" | fold -w "$(tput cols)"
}

wait_stop() {
  if [[ -n "${DOT_WAIT_PID}" ]]; then
    { kill -9 "${DOT_WAIT_PID}" && wait; } 2> /dev/null
    unset DOT_WAIT_PID
    set -m
    printf "${ESC_CEL2}\r"
    if [[ -n "${DOT_WAIT_FLT}" ]]; then
      printf "${ESC_CNL1}${ESC_CEL2}\r${ESC_CPL1}"
      unset DOT_WAIT_FLT
    fi
  fi
}

wait_info() {
  wait_stop
  info "$*"
}

wait_succ() {
  wait_stop
  succ "$*"
}

wait_fail() {
  wait_stop
  fail "$*"
}

handler() {
  wait_stop
  if [[ -d "${DOT_TEMPDIR}" ]]; then
    rm -rf "${DOT_TEMPDIR}" >> "${DOT_LOGFILE:-/dev/null}" 2>&1
  fi
  if (( $1 != 0 )); then
    fail 'Script execution failed'
    if [[ -f "${DOT_LOGFILE}" ]] && cnfm 'Would you like to see the detailed log?'; then
      printf '\n'
      cat "${DOT_LOGFILE}"
    fi
  fi
  if [[ -f "${DOT_LOGFILE}" ]]; then
    rm "${DOT_LOGFILE}"
  fi
  tput cnorm
}

cnfm() {
  printf "${ESC_INPT_ICON}?${ESC_RSTA} ${ESC_BOLD}%s${ESC_RSTA} [y/n] " "$*"; tput cnorm; read; tput civis
  [[ "${REPLY}" =~ ^[Yy].*$ ]]
}

log() {
  if [[ -n "$*" ]]; then
    printf '%s\n' "$*" >> "${DOT_LOGFILE:-/dev/null}"
  fi
}

http_file() {
  if [[ -z "$1" ]]; then
    printf 'http_file: First argument (source url) can not be empty\n' 1>&2
    return 1
  fi
  if [[ -z "$2" ]]; then
    printf 'http_file: Second argument (target file) can not be empty\n' 1>&2
    return 1
  fi
  if find_cmd 'curl'; then
    curl -fsL -o "$2" "$1" >> "${DOT_LOGFILE:-/dev/null}" 2>&1
  elif find_cmd 'wget'; then
    wget -q -O "$2" "$1" >> "${DOT_LOGFILE:-/dev/null}" 2>&1
  else
    log "Failed to download $1, cURL or Wget not found"
    return 1
  fi
}

find_cmd() {
  type "$1" &> /dev/null
}
