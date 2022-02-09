#!/usr/bin/env bash
ready="n"
while [ "$ready" == "n" ]; do
  if  kubectl get pods -n kube-system|grep kube-scheduler|grep -qi "1/1" ; then
    ready='y'
  else
    sleep 1
  fi
done
kubectl get pods >/tmp/afterpods
if [ -f "/hooks/after_ready.sh" ]; then
  bash /hooks/after_ready.sh
fi