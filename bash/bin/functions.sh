#!/bin/bash

function checkout-local-branch-fzf() {
  local branch_to_checkout
  branch_to_checkout=$(git branch | fzf)

  if [ -n "$branch_to_checkout" ]; then
    git checkout $branch_to_checkout
  fi
}
