#!/bin/bash

. $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/../util.sh

IP=$(kubectl --namespace=demos get svc daemon-demo \
        -o go-template='{{.spec.clusterIP}}')

run "gcloud compute ssh --zone=us-central1-b $SSH_NODE --command '\\
    while true; do \\
        curl --connect-timeout 1 -s $IP && echo || echo \"(timeout)\"; \\
        sleep 1; \\
    done \\
    '"
