#!/bin/bash

function get_lock() {
        # usage: get_lock LOCK_NAME <file descriptor>
        # example: get_lock ${PROGNAME} || exit
        local lock_file="${1}"
        local fd=${2:-200}

        eval "exec ${fd}>${lock_file}"

        flock -n ${fd} && return 0 && return 1
}

function wait_lock() {
        # usage: get_lock LOCK_NAME <file descriptor>
        # example: get_lock ${PROGNAME} || exit
        local lock_file="${1}"
        local fd=${2:-200}

        eval "exec ${fd}>${lock_file}"

        flock -e ${fd} && return 0 && return 1
}