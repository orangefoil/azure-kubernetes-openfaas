#!/bin/bash
export KUBECONFIG=artefacts/kubeconfig
kubectl -n kube-system create sa tiller \
&& kubectl create clusterrolebinding tiller \
  --clusterrole cluster-admin \
  --serviceaccount=kube-system:tiller

helm init --wait --service-account tiller
