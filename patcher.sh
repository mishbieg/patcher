#!/bin/bash

ROOT="${PWD}"
REPOSITORIES=(
    'build/make'
    'frameworks/av'
    'packages/apps/LockClock'
    'packages/apps/Settings'
    'system/core'
	'vendor/lineage'
)

echo Applying patches from patcher
for repository in "${REPOSITORIES[@]}"; do
    cd "${ROOT}/${repository}"

	echo
	echo "In directory: $PWD"
	if [ -d "${ROOT}/patcher/YumeMichi/${repository}" ]; then
		git am --keep-cr ${ROOT}/patcher/YumeMichi/${repository}/*.patch
	fi

	if [ -d "${ROOT}/patcher/mishbieg/${repository}" ]; then
		git am --keep-cr ${ROOT}/patcher/mishbieg/${repository}/*.patch
	fi

    cd "${ROOT}"
done
