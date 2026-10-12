#!/usr/bin/env bash
# Installs GHCup, GHC, cabal, stack and HLS, then builds the MOOC exercises once.
set -euo pipefail
sudo apt-get update
sudo apt-get install -y build-essential curl libffi-dev libgmp-dev libncurses-dev zlib1g-dev
curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | \
  BOOTSTRAP_HASKELL_NONINTERACTIVE=1 \
  BOOTSTRAP_HASKELL_INSTALL_STACK=1 \
  BOOTSTRAP_HASKELL_INSTALL_HLS=1 \
  BOOTSTRAP_HASKELL_ADJUST_BASHRC=1 sh
# shellcheck disable=SC1091
source "$HOME/.ghcup/env"
cd exercises && stack build