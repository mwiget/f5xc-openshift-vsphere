#!/bin/bash
for cluster in osc2 osc3; do
  kubectl --kubeconfig kc-$cluster $@
done
