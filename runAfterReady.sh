#!/usr/bin/env bash
schedulerPod="$(kubectl get pods -n kube-system|grep kube-scheduler|awk '{print $1}')"

while [[ "$(kubectl get pod -n kube-system $schedulerPod -o 'jsonpath={..status.conditions[?(@.type=="Ready")].status}')" != "True" ]]; do
 sleep 1
done

if [ -f "/hooks/after_ready.sh" ]; then
  bash /hooks/after_ready.sh
fi