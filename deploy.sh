#!/bin/bash
figlet STARTING DEPLOY
commitHash="$1"
commitAuthorEMail=$(git --no-pager log -1 --pretty="%cE")
commitAuthorName=$(git --no-pager log -1 --pretty="%aN")
echo "Last commit: $commitHash by $commitAuthorName with email $commitAuthorEMail"

figlet PREPARE SSH
mkdir -p ~/.ssh
printf "Host *\n\tStrictHostKeyChecking no\n\n" > ~/.ssh/config
eval "$(ssh-agent -s)"

# If some kind of formatting is necessary do it here

# Get the current gh-pages branch
mkdir deployPDF
cd deployPDF
git clone -b gh-pages "https://${GH_REPO_TOKEN}@github.com/${TRAVIS_REPO_SLUG}.git"
cd Uebungsblaetter
git config --global push.default simple

ls -la .git/
cat .git/config
rm .git/config
git config user.name "Travis CI"
git config user.email "deploy@travis-ci.org"
git checkout gh-pages
git pull origin gh-pages
echo "#################"
cat .git/config

rm -rf *
cp -R ../../output/* .
git add --all
git commit -m "Deploy code docs to GitHub Pages Travis build: ${TRAVIS_BUILD_NUMBER},  Commit: ${TRAVIS_COMMIT}"
git push origin gh-pages --force "https://${GH_REPO_TOKEN}@github.com/${TRAVIS_REPO_SLUG}.git" > /dev/null
cd ../..
rm -rf /deployPDF

figlet GIT FORWARD

case "$commitAuthorName" in
    "Paul Nykiel")
        sshKey="$GITLAB_TOKEN_0"
        ;;
    "jonas-merkle")
        sshKey="$GITLAB_TOKEN_1"
        ;;
    "Timmifixedit")
        sshKey="$GITLAB_TOKEN_2"
        ;;
    "TarikEnderes")
        sshKey="$GITLAB_TOKEN_3"
        ;;
    "4")
        sshKey="$GITLAB_TOKEN_4"
        ;;
    "5")
        sshKey="$GITLAB_TOKEN_5"
        ;;
esac

figlet SSH GIT

# Initialize ssh
echo "$sshKey" > ~/.ssh/key
chmod 600 ~/.ssh/key
ssh-add ~/.ssh/key

figlet GIT

# Push the Repo
git config --global user.email "$commitAuthorEMail"
git config --global user.name "$commitAuthorName"

git remote add gitlab git@github.com:aul12/Test.git
git status
git checkout -f master
#git push -f gitlab master

figlet FINISHED
