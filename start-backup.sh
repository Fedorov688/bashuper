#!/bin/bash

# A script to perform incremental backups using rsync
# inspired by https://linuxconfig.org/how-to-create-incremental-backups-using-rsync-on-linux

set -o errexit
set -o nounset
set -o pipefail

echo "FROM $1"
echo "TO   $2"

readonly SOURCE_DIR=$1
readonly BACKUP_DIR=$2
readonly DATETIME="$(date '+%Y-%m-%d_%H_%M_%S')"
readonly BACKUP_PATH="${BACKUP_DIR}/${DATETIME}"
readonly LATEST_LINK="${BACKUP_DIR}/latest"

mkdir -p "${BACKUP_DIR}"

rsync -av --delete \
  "${SOURCE_DIR}/" \
  --link-dest "${LATEST_LINK}" \
  "${BACKUP_PATH}"

rm -rf "${LATEST_LINK}"
ln -s "${BACKUP_PATH}" "${LATEST_LINK}"
