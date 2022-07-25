#!/bin/bash
for i in 2 3; do
  kubectl config use-context default/api-osc$i-mwlabs-net:6443/kube:admin
  kubectl $@
done
