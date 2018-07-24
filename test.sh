#!/usr/bin/env bash
set -e
set -o pipefail
set -x
output=$(echo "ping" | nc -w 10 ${TCP_APP_HOST} ${TCP_APP_PORT})
if [[ "$output" == "${EXPECTED_RESPONSE}" ]]; then
  echo "received \"${output}\" as expected"
  exit 0
else
  echo "unexpected response: \"${output}\""
  exit 1
fi
