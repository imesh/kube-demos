#!/bin/bash

. $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/../util.sh

desc "Color each node, slowly"
run "for NODE in \$(kubectl get nodes -o name | grep -v master | cut -f2 -d/); do \\
    kubectl label node \$NODE color=red; \\
    kubectl --namespace=demos describe ds daemons-demo; \\
    sleep 10; \\
done"
