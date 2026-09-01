#!/usr/bin/env bash
set -euo pipefail
# The compute node is configured by the controller after FreeIPA DNS is available.
dnf update -y
echo "compute1 bootstrap complete; controller orchestration will configure this node."