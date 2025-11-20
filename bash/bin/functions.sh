#!/bin/bash

function checkout-local-branch-fzf() {
  local branch_to_checkout
  branch_to_checkout=$(git branch | fzf)

  if [ -n "$branch_to_checkout" ]; then
    git checkout $branch_to_checkout
  fi
}

function list-branch-commits-not-on-master() {
    local current_branch
    current_branch=$(git branch --show-current)

    if [ -n "$current_branch" ]; then
        if [ $current_branch = "master" ]; then
            echo "Error: Cannot compare master branch to itself"
        fi

        git log --no-merges $current_branch ^master
    else
        echo "Error: could not get current branch name"
    fi
}

function list-branch-commits-not-on-main() {
    local current_branch
    current_branch=$(git branch --show-current)

    if [ -n "$current_branch" ]; then
        if [ $current_branch = "main" ]; then
            echo "Error: Cannot compare main branch to itself"
        fi

        git log --no-merges $current_branch ^main
    else
        echo "Error: could not get current branch name"
    fi
}
