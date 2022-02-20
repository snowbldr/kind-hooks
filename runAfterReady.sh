#!/usr/bin/env bash
function getSchedulerPod(){
  kubectl get pods -n kube-system|grep kube-scheduler|awk '{print $1}'
}

function isReady(){
  kubectl get pod -n kube-system $1 -o 'jsonpath={..status.conditions[?(@.type=="Ready")].status}'
}

while [[ "$(isReady $(getSchedulerPod))" != "True" ]]; do
 sleep 1
done

if [ -f "/hooks/after_ready.sh" ]; then
  bash /hooks/after_ready.sh > /tmp/hooks_after_ready.sh.log 2>&1
fi