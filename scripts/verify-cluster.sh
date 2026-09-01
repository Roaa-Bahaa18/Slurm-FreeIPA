#!/usr/bin/env bash
set -euo pipefail
echo "== IPA =="; sudo ipa user-find hpcuser
echo "== DNS =="; sudo dig @192.168.56.10 compute1.slurm.test +short
echo "== Slurm =="; sinfo; scontrol ping
echo "== Node =="; scontrol show node compute1
echo "Cluster verification passed."
