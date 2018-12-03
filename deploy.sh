#!/bin/bash
figlet STARTING DEPLOY
commitHash="$1"
commitMessage=$(git --no-pager log -1 --pretty="%B")
commitAuthorEMail=$(git --no-pager log -1 --pretty="%cE")
commitAuthorName=$(git --no-pager log -1 --pretty="%aN")
echo "Last commit: $commitHash by $commitAuthorName with email $commitAuthorEMail"

# Remove all output, we don't want to commit binaries
rm -rf output/
git clone "https://${GH_REPO_TOKEN}@github.com/SoPra-Team-10/Complete.git"
cd Complete/
git config --global push.default simple
git config user.name "$commitAuthorName"
git config user.email "$commitAuthorEMail"
mkdir -p Uebungsblaetter
cp ../README.md Uebungsblaetter/
cp -r ../Meilenstein* Uebungsblaetter/
git add -A
git commit -m "$commitMessage"
git push -f  "https://${GH_REPO_TOKEN}@github.com/SoPra-Team-10/Complete.git" master