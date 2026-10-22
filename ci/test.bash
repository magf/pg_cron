#!/usr/bin/env bash

set -xeuo pipefail

source /usr/local/greengage-db-devel/greengage_path.sh
source /home/gpadmin/gpdb_src/gpAux/gpdemo/gpdemo-env.sh

result=0

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR/.."

make installcheck || result=$?

cp -r results/ /logs/
cp regression.diffs /logs/ || true

if (( result != 0 )); then
  echo "'make installcheck' unsuccessfully completed."
  cat regression.diffs || true
fi

exit $result
