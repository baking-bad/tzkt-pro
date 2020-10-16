#!/usr/bin/env bash

set -e

ENV_FILENAME=".env"

# ------------------------------------------------------
# utils
# ------------------------------------------------------

function load_envs() {
  set -o allexport
  [[ -f $ENV_FILENAME ]] && source $ENV_FILENAME
  set +o allexport
}

# ------------------------------------------------------
# generate code samples from Open API spec file
# ------------------------------------------------------

function gen_code_samples() {
  load_envs
  local config=$1
	node open-api/code-samples/gen-code-samples.js $config
}

# ------------------------------------------------------
# merge code examples
# ... into Open API spec file
# ------------------------------------------------------

function merge_code_examples() {
  local code_samples=$1
	jq -r --argfile source $code_samples -f open-api/jq/open-api-merge-code-examples.jq
}

# ------------------------------------------------------
# cleanup Open API spec file
# ------------------------------------------------------

function cleanup() {
	jq -r -f open-api/jq/open-api-cleanup.jq
}

# ------------------------------------------------------
# associate tag groups
# ------------------------------------------------------

function assoc_tag_groups() {
	jq -r --argfile data $1 '."x-tagGroups" = $data'
}

# ------------------------------------------------------
# associate additional data
# ------------------------------------------------------

function merge_additional_data() {
	jq -r --argfile data $1 '. * $data'
}

"$@"
