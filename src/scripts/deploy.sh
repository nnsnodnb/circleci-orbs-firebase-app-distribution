#!/bin/bash -u

function escape {
    token=$1
    quoted="${token//\"/\\\"}"
    echo "${quoted}"
}

cmd="firebase appdistribution:distribute ${BINARY_PATH}"
if [[ -n "${APP}" ]]; then
    cmd="${cmd} --app ${TOKEN}"
fi
if [[ -n "${TOKEN}" ]]; then
    cmd="${cmd} --token ${TOKEN}"
fi
if [[ -n "${RELEASE_NOTE}" ]]; then
    escaped_release_notes=$(escape "${RELEASE_NOTE}")
    cmd="${cmd} --release-notes \"${escaped_release_notes}\""
fi
if [[ -n "${RELEASE_NOTE_FILE}" ]]; then
    cmd="${cmd} --release-notes-file ${RELEASE_NOTE_FILE}"
fi
if [[ -n "${TESTER}" ]]; then
    cmd="${cmd} --testers ${TESTER}"
fi
if [[ -n "${TESTER_FILE}" ]]; then
    cmd="${cmd} --testers-file ${TESTER_FILE}"
fi
if [[ -n "${GROUP}" ]]; then
    cmd="${cmd} --groups ${GROUP}"
fi
if [[ -n "${GROUP_FILE}" ]]; then
    cmd="${cmd} --groups-file ${GROUP_FILE}"
fi
if [[ "${DEBUG}" = "true" ]]; then
    cmd="${cmd} --debug"

    echo "${cmd}"
fi

eval "${cmd}"
