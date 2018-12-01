#!/bin/bash
figlet STARTING DEPLOY
commitHash="$1"
commitAuthorEMail=$(git --no-pager log -1 --pretty="%cE")
commitAuthorName=$(git --no-pager log -1 --pretty="%aN")
echo "Last commit: $commitHash by $commitAuthorName with email $commitAuthorEMail"

figlet DEPLOY PDFS

mkdir -p ~/.ssh
eval "$(ssh-agent -s)"
echo "$DEPLOY_KEY" | xxd -r -p > ~/.ssh/deployKey
chmod 600 ~/.ssh/deployKey
ssh-add ~/.ssh/deployKey

scp -i ~/.ssh/deployKey output/*.pdf paul@aul12.me:/var/www/html/Sopra/

# If some kind of formatting is necessary do it here

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
mkdir -p ~/.ssh
printf "Host *\n\tStrictHostKeyChecking no\n\n" > ~/.ssh/config
eval $(ssh-agent -s)
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
git push gitlab master

figlet FINISHED
