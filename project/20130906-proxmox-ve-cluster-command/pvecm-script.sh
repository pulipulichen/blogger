#!/bin/bash
#
# /root/scripts/pvecm-script.sh
#
# Program:
#   Send command to Proxmox VE Cluster other nodes.
#   
# History:
# 2013/09/06    Pudding <pulipuli.chen@gmail.com>   First release

# 檢查是否有指令
if [ "$1" == "" ]; then
    echo "Command not found."
    echo 'Example: ./pvecm-script.sh "date >> date.log"'
    exit 1
fi
if [ "$2" != "" ]; then
    echo "Bad command format."
    echo 'Example: ./pvecm-script.sh "date >> date.log"'
    exit 1
fi

# 歡迎訊息
echo "========================================="
echo "  Proxmox VE Cluster Command Controller"
echo "========================================="

# 取得指令
# CMD="date >> date.log"
CMD=$1
echo "Command: $CMD"

# 取得自己的IP
MY_IP=`/sbin/ifconfig |grep -B1 "inet addr" |awk '{ if ( $1 == "inet" ) { print $2 } else if ( $2 == "Link" ) { printf "%s:" ,$1 } }' |awk -F: '{ print $3 }'`
#echo "This host's IP is $MY_IP"

# 取得目前的所有Cluster的IP，輸入迴圈
CLUSTER_IP=`cman_tool nodes -a | grep Addresses | cut -d ':' -f 2 | cut -d ' ' -f 2`
echo "Following are other nodes' IP:"

# 開啟迴圈
FOUNDED="f"
ARY_I=0
for C_IP in $CLUSTER_IP
do
    PASS="t"

    # 輸入指令
    for M_IP in $MY_IP
    do
        #echo "$M_IP - $C_IP"
        if [ "$M_IP" == "$C_IP" ]; then
            PASS="f"
            #echo "$C_IP"
        fi
    done

    if [ "$PASS" == "t" ]; then
        echo "$C_IP"
        
        IP_ARY[$ARY_I]="$C_IP"
        ARY_I=`expr $ARY_I + 1`
        FOUNDED="t"
        #echo $ARY_I
    fi
done    

if [ "$FOUNDED" == "t" ]; then
    for ((index=0; index<${#IP_ARY[@]}; index++));
    do
        # 取得可以執行的IP

        IP=${IP_ARY[$index]}

        echo "=============================="
        echo "Send command to $IP"
        echo "=============================="

        # ssh root@192.168.100.3 "date >> date.log"
        ssh root@$IP "$CMD"

    done  

    echo "============"
    echo "  Complete"
    echo "============"
else
    echo "Other node not found"
fi