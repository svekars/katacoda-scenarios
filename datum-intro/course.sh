#!/bin/bash

sleep 1

chmod +x install-pachyderm.sh
./install-pachyderm.sh

until timeout 1s ./check_ready.sh app=pachd; do sleep 1; done

chmod +x deploy-pipeline.sh
./deploy-pipeline.sh
