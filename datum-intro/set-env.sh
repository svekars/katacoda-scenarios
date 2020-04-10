#!/bin/bash

launch.sh

echo "Installing pachctl..."
curl -o /tmp/pachctl.deb -L https://github.com/pachyderm/pachyderm/releases/download/v1.10.0/pachctl_1.10.0_amd64.deb
sudo dpkg -i /tmp/pachctl.deb
chmod +x install-pachyderm.sh
./install-pachyderm.sh

wait

chmod +x deploy-pipeline.sh
./deploy-pipeline.sh
