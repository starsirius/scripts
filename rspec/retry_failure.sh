#!/bin/bash
# Retry failed RSpec specs up to $RSPEC_RETRY times. If no meaningful $RSPEC_RETRY
# provided, it will exist normally.
#
# Usage:
#
# prompt> $RSPEC_RETRY=2 ./retry_failure.sh
#

set -x

if [[ $RSPEC_RETRY -gt 0 ]]; then
  FAILED=0
  until [[ $FAILED -eq $RSPEC_RETRY ]] || bundle exec rspec --format progress --only-failure; do
    ((FAILED++))
  done
  [[ $FAILED -ne $RSPEC_RETRY ]]
fi
