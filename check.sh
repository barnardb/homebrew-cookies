#!/bin/bash
set -euo pipefail

brew livecheck --formula Formula/cookies.rb --newer-only
brew audit --strict --git --online --new-formula --formula Formula/cookies.rb && echo "brew audit completed with exit status 0"
