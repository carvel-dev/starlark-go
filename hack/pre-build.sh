#!/usr/bin/env bash
set -o errexit -o nounset -o pipefail
#set -o xtrace

if [[ -z "${GOPATH}" ]]; then
  echo "$0: Error: GOPATH is not set."
  exit 1
fi

echo "- copying test files into expected location (under GOPATH):"
PKG_ROOT="${GOPATH}/src/go.starlark.net"
mkdir -p "${PKG_ROOT}"

for file in $(find . -type f -path "*testdata*"); do
  src_path="${PWD}/${file}"
  dest_path="${PKG_ROOT}/${file}"
  dest_dir=$(dirname "${dest_path}")

  mkdir -p "${dest_dir}"
  cp "${src_path}" "${dest_path}"
done

find "${PKG_ROOT}" -type f
