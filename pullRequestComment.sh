#!/bin/bash
if [ "$TRAVIS_PULL_REQUEST" != "false" ]
then
   curl -H "Authorization: token ${GH_REPO_TOKEN}" -X POST \
    -d "{\"body\": \"View the pdf on: https://sopra-team-10.github.io/Uebungsblaetter/$TRAVIS_BRANCH/\"}" \
    "https://api.github.com/repos/${TRAVIS_REPO_SLUG}/issues/${TRAVIS_PULL_REQUEST}/comments"
fi
