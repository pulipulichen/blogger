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
fi
if [ $1 < 100 ]; then
    echo "VMID format error."
    echo 'Example: ./restart-vm.sh 100'
    exit 1
fi
if [ $1 > 999 ]; then
    echo "VMID format error."
    echo 'Example: ./restart-vm.sh 100'
    exit 1
fi

# 製作停止&啟動指令： pvectl stop $VMID && pvectl start $VMID
CMD="pvectl stop $VMID && pvectl start $VMID"

# 傳送群集指令
pvecm-script.sh "$CMD"

# 自己執行指令
$CMD

# 送出完成訊息
echo "============"
echo "  Complete"
echo "============"