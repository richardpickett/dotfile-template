#!/bin/bash

# This takes the files from root_folder and installs them at /
# because git will not save a directory that doesn't have a file, we've placed .ignore_me files in empty folders as placeholders.
# the logic below will not copy those files, feel free to delete them when you have legitimate files in them

READLINK="$(which greadlink || which readlink)"

DIR="$(dirname "$(dirname "$(${READLINK} -f "${0}")")")"

cd "${DIR}/root_folder"

find . -type f | grep -v /.ignore_me$ | sed s/^\\.\\/// | while read file; do
    mkdir -p "/$(dirname "${file}")"
    mv "/${file}" "/${file}.old" 2>/dev/null
    echo linking \"/${file}\" -\> \"$(${READLINK} -f "${file}")\"
    ln -s "$(${READLINK} -f "${file}")" "/${file}"
    ls -l "/${file}"
done

# list of files that have to be un-linked in order for them to be used by their associated service:

for file in \
    /etc/hosts \
    /etc/fstab \
    /etc/hostname \
    /etc/systemd/resolved.conf \
    /home/syncthing/.config/syncthing/config.xml; do
    test -f "${file}" && cp --remove-destination "$(${READLINK} -f "${file}")" "${file}" # if the file exists, cp it in place, breaking the link
done

exit # just to be clear