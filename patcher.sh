#!/bin/bash

ROOT="${PWD}"
REPOSITORIES=(
    'bionic'
    'build/make'
    'external/sqlite'
    'frameworks/av'
    'packages/apps/LockClock'
    'packages/apps/Settings'
    'system/core'
    'vendor/lineage'
    'device/oneplus/onyx'
)

echo Applying patches from patcher
for repository in "${REPOSITORIES[@]}"; do
    cd "${ROOT}/${repository}"

	echo
	echo "In directory: $PWD"
	if [ -d "${ROOT}/patcher/YumeMichi/${repository}" ]; then
		git am --keep-cr ${ROOT}/patcher/YumeMichi/${repository}/*.patch
	fi

    cd "${ROOT}"
done
