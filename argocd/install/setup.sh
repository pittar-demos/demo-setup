#!/bin/bash

LANG=C
SLEEP_SECONDS=120

echo ""
echo "Installing OpenShift GitOps Operator."

oc apply -k https://github.com/redhat-cop/gitops-catalog/openshift-gitops-operator/overlays/stable?ref=main
#oc apply -k https://github.com/pittar/gitops-catalog/openshift-gitops-operator/overlays/stable-dex?ref=openshift-gitops-dex

echo "Waiting $SLEEP_SECONDS for GitOps Operator to install."

sleep $SLEEP_SECONDS

echo "Waiting for default Argo CD instance to complete rollout."

oc rollout status deploy/openshift-gitops-server -n openshift-gitops

echo "Adding extended cluster role for OpenShift GitOps."

oc apply -f argocd-clusterrole.yaml
oc apply -f argocd-clusterrolebinding.yaml

echo "Patching default Argo CD instance to use an edge terminated route and resource customizations."

oc patch argocd openshift-gitops -n openshift-gitops \
    --type='merge' \
    --patch "$(cat argocd-patch.yaml)"

echo "Done!"
