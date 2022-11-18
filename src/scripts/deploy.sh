#!/bin/bash -u

cmd="firebase appdistribution:distribute ${BINARY_PATH}"
if [[ -n "${APP}" ]]; then
	cmd="${cmd} --app ${TOKEN}"
fi
if [[ -n "${TOKEN}" ]]; then
    cmd="${cmd} --token ${TOKEN}"
fi
if [[ -n "${RELEASE_NOTE}" ]]; then
    cmd="${cmd} --release-notes ${RELEASE_NOTE}"
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
if [[ "${DEBUG}" = true ]]; then
    cmd="${cmd} --debug"
fi

if eval "${cmd}"; then
    echo "Success"
else
    echo "Fail"
    exit 1
fi
