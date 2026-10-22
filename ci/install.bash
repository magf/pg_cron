#!/usr/bin/env bash
set -xeo pipefail

source gpdb_src/concourse/scripts/common.bash
install_and_configure_gpdb
gpdb_src/concourse/scripts/setup_gpadmin_user.bash
make_cluster

source /usr/local/greengage-db-devel/greengage_path.sh
source gpdb_src/gpAux/gpdemo/gpdemo-env.sh

pushd "$(dirname "$0")/.."
  make
  make install
popd

mkdir -p /logs
chown gpadmin:gpadmin /logs
