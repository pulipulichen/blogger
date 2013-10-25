#!/bin/bash
#
# /root/scripts/restart-vm.sh
#
# History:
# 2013/09/14    Pudding <pulipuli.chen@gmail.com>   First release

# 檢查是否有VMID
if [ "$1" == "" ]; then
    echo "VMID not found."
    echo 'Example: ./restart-vm.sh 100'
    exit 1
elif [ $1 -lt 100 ]; then
    echo "VMID($1) format error. VMID must be between 100 to 999."
    echo 'Example: ./restart-vm.sh 100'
    exit 1
elif [ $1 -gt 999 ]; then
    echo "VMID($1) format error. VMID must be between 100 to 999."
    echo 'Example: ./restart-vm.sh 100'
    exit 1
fi

VMID=$1

# 製作停止&啟動指令： pvectl stop $VMID && pvectl start $VMID
CMD="vzctl restart $VMID --wait; qm reset $VMID"
echo "Command: $CMD"

# 傳送群集指令
/root/scripts/pvecm-script.sh "$CMD"

# 自己執行指令
vzctl restart $VMID --wait
qm reset $VMID

# 送出完成訊息
echo "===================="
echo "  Restart Complete"
echo "===================="
