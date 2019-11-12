#!/usr/bin/env bash

# Dependencies: None

# ktoken - # Print Bearer Token to login into kubernetes dashboard

ktoken() {
  local secret="$(kubectl -n kube-system get secret | awk '/^deployment-controller-token-/{print $1}')"

  kubectl -n kube-system describe secret "$secret" | awk '$1=="token:"{print $2}'
}
