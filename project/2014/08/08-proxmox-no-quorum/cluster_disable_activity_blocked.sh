#!/bin/bash
# Path: /root/pulipuli_scripts/cluster_disable_activity_blocked.sh
# 
# 解除Proxmox VE Cluster被鎖定狀態
# 

base_dir="/root/pulipuli_scripts"

is_blocked=`$base_dir/cluster_is_activity_blocked.sh`

if [ $is_blocked == 1 ];then
    pvecm expected 1
    service pve-cluster restart
fi