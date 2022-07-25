#!/bin/bash

for cluster in osc2 osc3; do

  folder="cluster-$cluster"
  if [ ! -e "$folder" ]; then
    die "folder $folder not found"
  fi

  server=$(cat $folder/.openshift_install_state.json | jq -r '.["*kubeconfig.AdminClient"].Config.clusters[].cluster.server')
  kubeadmin_password=$(cat $folder/.openshift_install_state.json | jq -r '.["*password.KubeadminPassword"].Password')
  if [ -z "$server" ]; then
    echo "no server found in state file"
    exit 1
  fi
  echo oc login --kubeconfig kc$cluster --username kubeadmin --password $kubeadmin_password $server ...
  oc login --kubeconfig kc$cluster --username kubeadmin --password $kubeadmin_password --insecure-skip-tls-verify=true $server
  ls -l kc$cluster
done
