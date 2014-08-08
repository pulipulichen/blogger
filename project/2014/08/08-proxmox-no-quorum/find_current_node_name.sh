#!/bin/bash
# Path: /root/pulipuli_scripts/find_node_name.sh
# 
# 取得節點的名稱
# 

nodename=`pvecm status | grep "Node name:" | cut -d ":" -f 2 | cut -d " " -f 2`
echo $nodename