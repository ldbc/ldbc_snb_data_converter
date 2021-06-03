#!/bin/bash

set -eu
set -o pipefail

cd "$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )/.."

# loads the updates in the `batches` directory
# these files always have headers
PATHVAR=${DATA_DIR}
POSTFIX=".csv"
HEADER=""
#HEADER=${HEADER:=", HEADER"}

DUCKDB_PATH="${DUCKDB_PATH:=../}"

rm -f ldbc-sql-workflow-test.duckdb
cat sql/schema-composite-merged-fk.sql | ${DUCKDB_PATH}duckdb ldbc-sql-workflow-test.duckdb
cat sql/initialize-delete-candidate-tables.sql | ${DUCKDB_PATH}duckdb ldbc-sql-workflow-test.duckdb

echo "Load initial snapshot"

# initial snapshot
echo "-> Static entities"
cat sql/snb-load-composite-merged-fk-static.sql | \
    sed "s|\${PATHVAR}|${PATHVAR}/initial_snapshot/|g" | \
    sed "s|\${POSTFIX}|${POSTFIX}|g" | \
    sed "s|\${HEADER}|${HEADER}|g" | \
    ${DUCKDB_PATH}duckdb ldbc-sql-workflow-test.duckdb

echo "-> Dynamic entities"
cat sql/snb-load-composite-merged-fk-dynamic.sql | \
    sed "s|\${PATHVAR}|${PATHVAR}/initial_snapshot/|g" | \
    sed "s|\${DYNAMIC_PREFIX}|dynamic/|g" | \
    sed "s|\${POSTFIX}|${POSTFIX}|g" | \
    sed "s|\${HEADER}|${HEADER}|g" | \
    ${DUCKDB_PATH}duckdb ldbc-sql-workflow-test.duckdb

echo "Loaded initial snapshot"
