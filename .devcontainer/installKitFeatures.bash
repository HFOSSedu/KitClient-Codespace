#!/bin/bash

# If the folder that was opened is a kit (.kit exists) install the kit features.
if [ -d .kit ] && [ "$(pwd)" != "/home/$USER" ]; then
  .kit/install-features-into-client/run.sh
fi
