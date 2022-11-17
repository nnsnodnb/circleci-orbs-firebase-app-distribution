#!/bin/bash

cmd="firebase appdistribution:distribute ${BINARY_PATH}"
if [[ -n ${TOKEN} ]]; then
    cmd="${cmd} --token ${TOKEN}"
fi
if [[ -n ${RELEASE_NOTE} ]]; then
    cmd="${cmd} --release-note ${RELEASE_NOTE}"
fi
if [[ -n ${RELEASE_NOTE_FILE} ]]; then
    cmd="${cmd} --release-note-file ${RELEASE_NOTE_FILE}"
fi
if [[ -n ${TESTERS} ]]; then
    cmd="${cmd} --testers ${TESTERS}"
fi
if [[ -n ${TESTERS_FILE} ]]; then
    cmd="${cmd} --testers_file ${TESTERS_FILE}"
fi
if [[ -n ${GROUPS} ]]; then
    cmd="${cmd} --groups ${GROUPS}"
fi
if [[ -n ${GROUPS_FILE} ]]; then
    cmd="${cmd} --groups_file ${GROUPS_FILE}"
fi
if [[ "${DEBUG}" = true ]]; then
    cmd="${cmd} --debug"
fi

eval "${cmd}"

if [[ $? -eq 0 ]]; then
    echo "Success"
else
    echo "Fail"
fi
