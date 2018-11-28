#!/bin/bash
commitHash="$1"
commitAuthorEMail=$(git --no-pager log -1 --pretty="%cE")
commitAuthorName=$(git --no-pager log -1 --pretty="%aN")
echo "Last commit: $commitHash by $commitAuthorName with email $commitAuthorEMail"

# If some kind of formatting is necessary do it here

case "$commitAuthorName" in
    "aul12")
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

# Initialize ssh
eval $(ssh-agent -s)
mkdir -p ~/.ssh
echo -e "Host *\n\tStrictHostKeyChecking no\n\n" > ~/.ssh/config

# Push the Repo
git config --global user.email "$commitAuthorEMail"
git config --global user.name "$commitAuthorName"

git remote add gitlab git@github.com:aul12/Test.git
git checkout master
git push gitlab master
