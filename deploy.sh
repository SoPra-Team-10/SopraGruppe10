#!/bin/bash
figlet STARTING DEPLOY
commitHash="$1"
commitAuthorEMail=$(git --no-pager log -1 --pretty="%cE")
commitAuthorName=$(git --no-pager log -1 --pretty="%aN")
echo "Last commit: $commitHash by $commitAuthorName with email $commitAuthorEMail"

# Get the current gh-pages branch
mkdir deployPDF
cd deployPDF
git clone -b gh-pages "https://${GH_REPO_TOKEN}@github.com/SoPra-Team-10/Uebungsblaetter.git"
cd Uebungsblaetter

git config --global push.default simple
git config user.name "Travis CI"
git config user.email "deploy@travis-ci.org"
echo "#############"
cat .git/config
echo "#############"
#git remote set-url origin 'https://github.com/SoPra-Team-10/Uebungsblaetter.git'
rm -rf *
cp -R ../../output/* .
git add --all
git commit -m "Deploy code docs to GitHub Pages Travis build: ${TRAVIS_BUILD_NUMBER},  Commit: ${TRAVIS_COMMIT}"
git push -f origin gh-pages
cd ../..
rm -rf /deployPDF
cd ../..

# Remove all output, we don't want to commit binaries
rm -rf output/
# TODO clone the complete repo, add the current files as a subdirectory and create a commit
