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

echo Reverting patches from patcher
for repository in "${REPOSITORIES[@]}"; do
    cd "${ROOT}/${repository}"

	echo
	echo "In directory: $PWD"
	echo Aborting am
	git am --abort
	git reset --hard
	if [ -d "${ROOT}/patcher/YumeMichi/device/oneplus/onyx" ]; then
	    echo Checking out branch lineage-16.0
	    git checkout remotes/github/lineage-16.0
	else
	    echo Checking out branch remotes/github/lineage-16.0
	    git checkout remotes/github/lineage-16.0-sultan
	fi
	echo Cleaning up repo
	git clean -fd

    cd "${ROOT}"
done
