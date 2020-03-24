#!/bin/bash

ROOT="${PWD}"
REPOSITORIES=(
    'device/oneplus/onyx'
    'system/sepolicy'
)

echo Reverting patches from patcher
for repository in "${REPOSITORIES[@]}"; do
    cd "${ROOT}/${repository}"

	echo
	echo "In directory: $PWD"
	echo Aborting am
	git am --abort
	git reset --hard
	echo Checking out branch lineage-17.1
	git checkout remotes/github/lineage-17.1
	echo Cleaning up repo
	git clean -fd

    cd "${ROOT}"
done
