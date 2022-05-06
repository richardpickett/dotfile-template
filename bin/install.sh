#!/bin/bash

if [ "root" != "$(whoami)" ]; then # force root
    sudo "${0}" "${@}"
    exit
fi

READLINK="$(which greadlink || which readlink)"

DIR="$(dirname "$(dirname "$(${READLINK} -f "${0}")")")"

cd "${DIR}"

chmod a+x bin/*.sh

for installer in $(ls bin/install_*.sh | sort); do
    if ! "${installer}"; then
        echo INSTALL FAIL on "${installer}"
        exit 1
    fi
done
