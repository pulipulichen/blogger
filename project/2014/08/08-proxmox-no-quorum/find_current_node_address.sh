#!/bin/bash
# Path: /root/pulipuli_scripts/find_current_node_address.sh
# 
# 取得節點的網路位址
# 

result=`pvecm status | grep "Node addresses:" | cut -d ":" -f 2 | cut -d " " -f 2`
echo $result