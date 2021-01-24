#!/bin/bash
set -euo pipefail

[ -z "$(git status --porcelain)" ] || {
   echo "The working copy is not pristine"
   git status
   exit 1
}

livecheck_json=$(brew livecheck --formula Formula/cookies.rb --json)
jq <<<"${livecheck_json}"

outdated=$(jq '.[0].version | if .newer_than_upstream then error("Formula version is newer than upstream version") else .outdated end' <<<"${livecheck_json}")
[[ ${outdated} == true ]] || {
  echo "Nothing to do because outdated=${outdated}"
  exit
}

current=$(jq --raw-output '.[0].version.current' <<<"${livecheck_json}")
latest=$(jq --raw-output '.[0].version.latest' <<<"${livecheck_json}")

echo "Updating cookies from v${current} to v${latest}"
perl -p -i.bak -e "s|tag: \"v${current}\"\E|tag: \"v${latest}\"|g" Formula/cookies.rb
rm Formula/cookies.rb.bak
git add Formula/cookies.rb

./check.sh
brew upgrade Formula/cookies.rb
brew test Formula/cookies.rb

git commit -m "Updated cookies to v${latest}"

[ -z "$(git status --porcelain)" ] || {
   echo "The working copy is not pristine after committing!"
   git status
   exit 1
}

git push
