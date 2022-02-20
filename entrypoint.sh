#!/usr/bin/env bash

if [ -f "/hooks/before_start.sh" ]; then
  bash /hooks/before_start.sh > /tmp/hooks_before_start.sh.log 2>&1
fi

nohup bash /runAfterReady.sh > /tmp/hooks_runAfterReady.sh.log 2>&1 & disown

exec /usr/local/bin/kind-entrypoint "$@"
