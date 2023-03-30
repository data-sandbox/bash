#!/bin/bash

# Sync folders on main drive to external primary HD
# and sync primary HD with replica HD.
#
# Replace volume names, flag paths, and folder lists
# accordingly.

function log_date {
    timestamp=$(date +%Y-%m-%d_%H:%M:%S)
    line="$timestamp $1"
    echo "$line" >> "sync_log.txt"
}

function sync_primary {
    if [ -f "$primary_flag" ]
    then
        echo "Primary connected. Beginning sync..."
        for i in $1; do
            rsync -av --delete --progress "main/$i" "$primary/"  
        done
        log_date "primary"
    else
        echo "Primary not connected."
        exit 1
    fi
}

function sync_replica {
    if [ -f "$replica_flag" ]
    then
        echo "Replica connected. Beginning sync..."
        for i in $1; do
            rsync -av --delete --progress "$primary/$i" "$replica/"  
        done
        log_date "replica"
    else
        echo "Replica not connected."
        exit 1
    fi
}

function main {
    # Volume names
    primary="primary"
    replica="replica"
    # Flags to confirm drive ordering
    primary_flag="./primary/primary.txt"
    replica_flag="./replica/replica.txt"

    # Sync folder args on main with primary HD
    sync_primary "dummy"

    # Sync folder args on primary HD with replica HD
    sync_replica "dummy dummy2"
}

main