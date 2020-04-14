#!/bin/bash

sleep 10
curl -o /tmp/pachctl.deb -L https://github.com/pachyderm/pachyderm/releases/download/v1.10.0/pachctl_1.10.0_amd64.deb
sudo dpkg -i /tmp/pachctl.deb

sleep 1

chmod +x install-pachyderm.sh
./install-pachyderm.sh

until timeout 1s ./check_ready.sh app=pachd; do sleep 5; done

chmod +x deploy-pipeline.sh
./deploy-pipeline.sh
