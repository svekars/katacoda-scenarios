#!/bin/bash
(($(kubectl get pod | grep pachd 2>/dev/null | wc -l) >= 1)) && echo "done"
