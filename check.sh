#!/bin/bash
set -euo pipefail

livecheck_json=$(brew livecheck --formula Formula/cookies.rb --json)
jq <<<"${livecheck_json}"

newer_or_outdated=$(jq '.[0].version | .newer_than_upstream or .outdated' <<<"${livecheck_json}")
[[ ${newer_or_outdated} == false ]] || {
   echo "Formula version is unexpectedly newer than upstream version or outdated!"
   exit 1
}

brew audit --strict --git --online --new-formula --formula Formula/cookies.rb && echo "brew audit completed with exit status 0"
