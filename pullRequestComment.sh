#!/bin/bash
if [ "$TRAVIS_PULL_REQUEST" != "false" ]
then
    MILESTONE = $(ls -1 | grep Meilenstein | sort | tail -n 1)
    curl -H "Authorization: token ${GH_REPO_TOKEN}" -X POST \
    -d "{\"body\": \"View the pdf on: https://sopra-team-10.github.io/Uebungsblaetter/$TRAVIS_PULL_REQUEST_BRANCH/$MILESTONE\"}" \
    "https://api.github.com/repos/${TRAVIS_REPO_SLUG}/issues/${TRAVIS_PULL_REQUEST}/comments"
fi
