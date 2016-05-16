#!/bin/bash

. $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/../util.sh

desc "Create a service that fronts any version of this demo"
run "cat $(relative svc.yaml)"
run "kubectl --namespace=demos create -f $(relative svc.yaml)"

desc "Run v1 of our app"
run "cat $(relative rc-v1.yaml)"
run "kubectl --namespace=demos create -f $(relative rc-v1.yaml)"

tmux new -d -s my-session \
    "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/split1_lhs.sh" \; \
    split-window -h -d "sleep 10; $(dirname $BASH_SOURCE)/split1_rhs.sh" \; \
    attach \;
