#!/bin/bash
# Path: /root/pulipuli_scripts/cluster_activity_unblocked.sh
# 
# 解除Proxmox VE Cluster被鎖定狀態
# 

base_dir=${PWD}

is_blocked=`$base_dir/cluster_is_activity_blocked.sh`

if [ $is_blocked == 1 ];then
    pvecm expected 1
    service pve-cluster restart

    if [ -f $base_dir/mailtoa.sh ];then
        $base_dir/mailto.sh "cluster_activity_unblocked"
    fi
fi