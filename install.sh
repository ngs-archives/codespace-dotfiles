#!/bin/bash

set -eu

DIR=$(cd $(dirname $0) && pwd)
for F in $(find $DIR -type f -name '.*'); do
    FN=$(basename $F)
    rm -f "${HOME}/${FN}"
    ln -s "${DIR}/${FN}" "${HOME}/${FN}"
done

for D in $(find $DIR -type d -name '.*' \( ! -name .git \)); do
    DN=$(basename $D)
    for F in $(find $D -type f); do
        FN=$(basename $F)
        mkdir -p "${HOME}/${DN}"
        rm -f "${HOME}/${DN}/${FN}"
        ln -s $F "${HOME}/${DN}/${FN}"
    done
done

sudo apt-get install direnv
