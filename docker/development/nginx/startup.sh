#!/usr/bin/env bash
# Start the cron service in the background. Unfortunately upstart doesn't work yet.
./usr/sbin/php-fpm7.3 -D
status=$?
if [ $status -ne 0 ]; then
  echo "Failed to start php-fpm7.3: $status"
  exit $status
fi