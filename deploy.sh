#!/bin/bash

#deploy gh-pages
echo '[deploy_gh-pages]: create new temp dir'
mkdir deployGH-PAGES
cd deployGH-PAGES

echo '[deploy_gh-pages]: clone gh-pages branch'
git clone -b gh-pages https://github.com/${TRAVIS_REPO_SLUG}.git
export TRAVIS_REPO_NAME=${TRAVIS_REPO_SLUG#*/}
cd ${TRAVIS_REPO_NAME}

echo '[deploy_gh-pages]: configuring git'
git config --global push.default simple
git config user.name "Travis CI"
git config user.email "deploy@travis-ci.org"

echo '[deploy_gh-pages]: copy new files'
if [ "$TRAVIS_BRANCH" == "master" ]
then
    rm -f *
    cp ../../output/* .
else
    rm -rf "$TRAVIS_BRANCH"
    mkdir -p "$TRAVIS_BRANCH"
    cp ../../output/* ./"$TRAVIS_BRANCH"/
fi

echo '[deploy_gh-pages]: git add & commit'
git add --all
git commit -m "Deploy code docs to GitHub Pages Travis build: ${TRAVIS_BUILD_NUMBER}" -m "Commit: ${TRAVIS_COMMIT}"

echo '[deploy_gh-pages]: git push'
git push --force "https://${GH_REPO_TOKEN}@github.com/${TRAVIS_REPO_SLUG}.git" > /dev/null 2>&1

echo '[deploy_gh-pages]: remove temp dir'
cd ../..
rm -rf deployGH-PAGES


echo '[deploy_gh-pages]: Posting link'
if [ "$TRAVIS_PULL_REQUEST" != "false" ]
then
   curl -H "Authorization: token ${GH_REPO_TOKEN}" -X POST \
    -d "{\"body\": \"View the pdf on: https://sopra-team-10.github.io/Uebungsblaetter/$TRAVIS_BRANCH/\"}" \
    "https://api.github.com/repos/${TRAVIS_REPO_SLUG}/issues/${TRAVIS_PULL_REQUEST}/comments"
fi

#deploy to commplete repo, only on master
if [ "$TRAVIS_BRANCH" == "master" ]
then
    echo '[deploy-complete]: Get data'
    commitHash="$1"
    commitMessage=$(git --no-pager log -1 --pretty="%B")
    commitAuthorEMail=$(git --no-pager log -1 --pretty="%cE")
    commitAuthorName=$(git --no-pager log -1 --pretty="%aN")
    echo "[deploy-complete]: Last commit: $commitHash by $commitAuthorName with email $commitAuthorEMail"

    # Remove all output, we don't want to commit binaries
    echo '[deploy-complete]: Clone'
    rm -rf output/
    git clone "https://${GH_REPO_TOKEN}@github.com/SoPra-Team-10/Complete.git"
    cd Complete/
    git config --global push.default simple
    git config user.name "$commitAuthorName"
    git config user.email "$commitAuthorEMail"
    echo '[deploy-complete]: Copy'
    rm -rf Uebungsblaetter
    mkdir -p Uebungsblaetter
    cp ../README.md Uebungsblaetter/
    cp -r ../Meilenstein* Uebungsblaetter/
    cp -r ../.gitignore Uebungsblaetter/
    echo '[deploy-complete]: Commit'
    git add -A
    git commit -m "$commitMessage"
    git push -f  "https://${GH_REPO_TOKEN}@github.com/SoPra-Team-10/Complete.git" master
fi
