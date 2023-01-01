#!/bin/bash

$IMPALA_HOME/bin/kerberos/experimental-kerberos-setup.sh

source $IMPALA_HOME/bin/impala-config.sh && \
$IMPALA_HOME/bin/create-test-configuration.sh -create_metastore && \
$IMPALA_HOME/testdata/bin/run-all.sh -format && \
$IMPALA_HOME/bin/start-impala-cluster.py --state_store_args="
  --enable_legacy_avx_support
  -hostname=local.dev
  -catalog_service_host=local.dev
  -state_store_host=local.dev
  -principal=impdev/local.dev@LOCAL.DEV
" --catalogd_args="
  --enable_legacy_avx_support
  -hostname=local.dev
  -principal=impdev/local.dev@LOCAL.DEV
  -catalog_service_host=local.dev
  -state_store_host=local.dev
  -kudu_master_hosts=local.dev
" --impalad_args="
  --enable_legacy_avx_support
  -hostname=local.dev
  -be_principal=impdev/local.dev@LOCAL.DEV
  -catalog_service_host=local.dev
  -state_store_host=local.dev
  -kudu_master_hosts=local.dev
"

