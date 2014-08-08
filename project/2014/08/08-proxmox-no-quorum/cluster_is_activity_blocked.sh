#!/bin/bash
# Path: /root/pulipuli_scripts/cluster_is_activity_blocked.sh
# 
# 檢查Proxmox VE Cluster是否正常運作，還是被鎖定了
# 

# 要執行的指令
exec="pvecm status"

# 取得執行結果
result=`$exec | grep "Activity blocked"`

# 檢查結果是否存在
if [ -z "$result" ];then
    # 如果是空值，表示沒被鎖住
    echo 0
else
    # 如果不是空值，表示被鎖住了
    echo 1
fi
