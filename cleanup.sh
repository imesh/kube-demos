#!/bin/bash

. $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/util.sh

desc "Nuke it all"
run "kubectl delete namespace demos"
while kubectl get namespace demos >/dev/null 2>&1; do
  run "kubectl get namespace demos"
done
run "kubectl get namespace demos"
run "kubectl get namespaces"
