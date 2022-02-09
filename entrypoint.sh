#!/usr/bin/env bash

if [ -f "/hooks/before_start.sh" ]; then
  bash /hooks/before_start.sh
fi

nohup bash /runAfterReady.sh & disown

exec /usr/local/bin/kind-entrypoint "$@"
