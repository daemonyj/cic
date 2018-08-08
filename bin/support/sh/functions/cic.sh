#!/usr/bin/env bash
TRACKS_PATH="${TRACKS_PATH:-${CURRENT_PATH}/../tracks}"
EXERCISES_PATH="${EXERCISES_PATH:-${CURRENT_PATH}/../exercises}"

function tracks_path(){
    echo "${TRACKS_PATH}"
}

function exercises_path(){
    echo "${EXERCISES_PATH}"
}

function cic_dir(){
    echo "/cic"
}

function cic_config_dir(){
  echo "$(cic_dir)/.cic"
}

function cic_bin(){
    echo "$(cic_dir)/bin"
}

function cic_exports() {
    local cic_exports="TRACKS_PATH=$(tracks_path) EXERCISES_PATH=$(exercises_path)"
    cic_exports="SCAFFOLD_STRUCTURE=$(cic_config_dir)/exercise_scaffold.yml"
    echo "${cic_exports} SCAFFOLD_PATH=$(cic_config_dir)/exercise_scaffold"
}

function bootstrap_cic_environment(){
    # shellcheck disable=SC2016
    local rbenv_init='eval "$(rbenv init -)"'
    local source_bin_scripts=". $(cic_bin)/.env"
    echo "${rbenv_init} && ${source_bin_scripts} && $(cic_exports)"
}


CIC_CURRENT_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
# shellcheck source=bin/support/sh/functions/cic_docker.sh
source "${CIC_CURRENT_PATH}/cic_docker.sh"


