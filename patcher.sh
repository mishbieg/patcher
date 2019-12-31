#!/bin/bash

ROOT="${PWD}"
REPOSITORIES=(
    'kernel/oneplus/onyx'
    'device/oneplus/onyx'
	'system/sepolicy'
)

echo Applying patches from patcher
for repository in "${REPOSITORIES[@]}"; do
    cd "${ROOT}/${repository}"

	echo
	echo "In directory: $PWD"
	if [ -d "${ROOT}/patcher/mishbieg/${repository}" ]; then
		git am --keep-cr ${ROOT}/patcher/mishbieg/${repository}/*.patch
	fi

    cd "${ROOT}"
done
