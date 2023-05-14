#!/usr/bin/env bash
#  Copyright (c) 2018-2020. Prasad Tengse
#

set -eo pipefail

CLOUD_IMAGE_DOWNLOAD_PATH="${REPO_ROOT:-.}/vendor/cloudimages"

echo -e "\033[38;5;122m‣ Debian 12.x Bookworm\033[0m"

echo -e "- Ensure directories"
mkdir -p "${CLOUD_IMAGE_DOWNLOAD_PATH}/debian-12"

(
  cd "${CLOUD_IMAGE_DOWNLOAD_PATH}/debian-12"
  echo -e "- Download checksums"
  curl -sSfLO https://cloud.debian.org/images/cloud/bookworm/daily/latest/SHA512SUMS
  echo -e "- Download image"
  curl -fLO --progress-bar https://cloud.debian.org/images/cloud/bookworm/daily/latest/debian-12-generic-amd64-daily.qcow2
  echo -e "- Verify integrity"
  sha512sum -c --ignore-missing --strict SHA512SUMS
)
