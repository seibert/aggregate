#!/bin/bash

. activate "${PREFIX}"
PATH=${PREFIX}/cmake-bin/bin:${PATH}
cd "${SRC_DIR}"

DEST="${PWD}"/install-openmp
[[ -d "${DEST}" ]] && rm -rf "${DEST}"
pushd llvm_build_final/projects/openmp
  make install DESTDIR="${DEST}"
popd
pushd "${DEST}"/"${PWD}"/prefix
  cp -Rf * "${PREFIX}"
popd
