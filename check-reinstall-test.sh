#!/bin/bash
set -euo pipefail

./check.sh

if brew list Formula/cookies.rb &>/dev/null; then
   brew uninstall Formula/cookies.rb
fi
brew install Formula/cookies.rb
brew test cookies
