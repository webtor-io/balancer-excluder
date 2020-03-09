#!/bin/sh
kubectl get no -o json | jq '.items[] | select(.metadata.labels."k8s.scaleway.com/pool-name" == "default" and .metadata.labels."node.kubernetes.io/exclude-from-external-load-balancers" != "true") | "kubectl label nodes \(.metadata.name) node.kubernetes.io/exclude-from-external-load-balancers=true"' | xargs -n 1 sh -c
echo "Finish!"