#!/bin/bash
#kubectl get pod -l app=pachd -o jsonpath="{.items[0].status.phase}"
while [[ "$(kubectl get pod -l app=pachd | grep -v Running | grep -v Completed | wc -l)" != 1 ]]; do
  sleep 1;
done
