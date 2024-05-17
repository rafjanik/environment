#!/bin/bash

# Nazwa użytkownika GitHub
username="rafjanik"

# Token github - https://github.com/settings/tokens
token=""

# Funkcja do pobierania repozytoriów z danej strony
fetch_repos() {
    local visibility=$2
    curl -s -H "Authorization: token $token" "https://api.github.com/user/repos?visibility=$visibility&per_page=100" | jq -r '.[].clone_url'
}

# Pobierz i klonuj wszystkie publiczne repozytoria
while true; do
    repos=$(fetch_repos "public")
    if [ -z "$repos" ]; then
        break
    fi
    for repo in $repos; do
        git clone $repo
    done
done

# Pobierz i klonuj wszystkie prywatne repozytoria
while true; do
    repos=$(fetch_repos "private")
    if [ -z "$repos" ]; then
        break
    fi
    for repo in $repos; do
        git clone $repo
    done
done