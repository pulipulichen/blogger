#!/bin/bash
#
# /root/nbas/nbas.sh
#
# Program:
#   Network Broken Automatic Shutdown (NBAS) Script
# 
# Install:
# 
#   su root
#   crontab -e
#   * * * * * /root/nbas/nbas.sh
# 
# History:
# 2013/09/08    Pudding <pulipuli.chen@gmail.com>   First release


# ================
# 設定值
# ================

if [ -L $0 ] ; then
    DIR=$(dirname $(readlink -f $0)) ;
else
    DIR=$(dirname $0) ;
fi ;

# 載入設定檔案
source ${DIR}/nbas.conf

# 檢查變數是否存在，不然給予預設值

# Enable NBAS. ("t" or "f", default "t")
if [ -z "$NBAS_ENABLE" ]; then
    NBAS_ENABLE="t"
fi

# Listening Network Device (default "eth0")
if [ -z "$NBAS_DEVICE" ]; then
    NBAS_DEVICE="eth0"
fi

# Shutdown Lock File Path (default "/root/nbas")
if [ -z "$NBAS_PATH" ]; then
    NBAS_PATH="/root/nbas"
fi

# Delay enable NB AS. Unit is minute. (default 30)
if [ -z "$NBAS_UPTIME_DELAY" ]; then
    NBAS_UPTIME_DELAY=1
fi

# Delay shutdown system after network broken. Unit is minute. (default 5)
if [ -z "$NBAS_SHUTDOWN_DELAY" ]; then
    NBAS_SHUTDOWN_DELAY=2
fi

# Alert when shutdown mission start
if [ -z "$NBAS_ALERT_SHUTDOWN" ]; then
    NBAS_ALERT_SHUTDOWN="Network broken. System is going to shutdown after $NBAS_SHUTDOWN_DELAY minutes!"
fi

# Alert when shutdown mission cancel
if [ -z "$NBAS_ALERT_CANCEL" ]; then
    NBAS_ALERT_CANCEL="Network recovery. Shutdown cancelled."
fi

NBAS_LOCK="${NBAS_PATH}/nbas.lock"

# Script excute before shutdown
if [ -z "$NBAS_BEFORE_SHUTDOWN_SCRIPT" ]; then
    NBAS_BEFORE_SHUTDOWN_SCRIPT=""
fi

# Script excute time after network broken. Unit is minute. (default 3)
if [ -z "$NBAS_BEFORE_SHUTDOWN_SCRIPT_DELAY" ]; then
    NBAS_BEFORE_SHUTDOWN_SCRIPT_DELAY=3
fi
NBAS_BEFORE_SHUTDOWN_SCRIPT_DELAY_MIN=$[$NBAS_BEFORE_SHUTDOWN_SCRIPT_DELAY*60]

# 判斷是否有關機鎖，並嘗試取得鎖中的時間資訊
LOCK_EXIST=`test -f $NBAS_LOCK && echo "t" || echo "f"`

# ================
# 啟用判斷
# ================

# 是否啟用NBAS
if [ "$NBAS_ENABLE" == "f" ]; then
    exit 1
fi

# 判斷開機時間
UPTIME=`awk  '{print $0/60;}' /proc/uptime | cut -d '.' -f 1`
if [ "$UPTIME" -lt "$NBAS_UPTIME_DELAY" ]; then
    if [ "$LOCK_EXIST" == "t" ]; then
        rm -f $NBAS_LOCK
    fi
    exit 1
fi    

# ===============
# 狀態蒐集
# ===============

# 偵測網路
NETWORK_BROKEN=f
NETWORK_STATUS=`cat /sys/class/net/$NBAS_DEVICE/carrier`
if [ $NETWORK_STATUS == 0 ]; then
    NETWORK_BROKEN=t
fi


# =================
# 針對網路狀態的動作
# =================

# 如果網路斷線了
if [ "$NETWORK_BROKEN" == "t" ]; then

    # 判斷是否有關機鎖
    if [ "$LOCK_EXIST" == "t" ]; then
        # 如果已經鎖住了，那就不需要其他動作
        exit 1
    fi

    # 建立關機鎖
    date > $NBAS_LOCK

    # 進行關機並發出通知
    /sbin/shutdown -h +$NBAS_SHUTDOWN_DELAY $NBAS_ALERT_SHUTDOWN & 2> /dev/null
    echo $NBAS_ALERT_SHUTDOWN | /usr/bin/wall 2> /dev/null

    #/usr/bin/ssh root@10.0.0.1 "/root/scripts/shutdown-other-nodes.sh"
    
    # 先睡個指定DELAY的時間
    sleep $NBAS_BEFORE_SHUTDOWN_SCRIPT_DELAY_MIN

    # 看看網路是否還是斷線
    NETWORK_STATUS=`cat /sys/class/net/$NBAS_DEVICE/carrier`
    if [ $NETWORK_STATUS == 0 ]; then
        
        # 如果還是斷線，那就執行指令
        $NBAS_BEFORE_SHUTDOWN_SCRIPT
    fi

    # 完成斷線時動作

fi

# 如果網路沒有斷線
if [ "$NETWORK_BROKEN" == "f" ]; then

    # 判斷是否有關機鎖
    if [ "$LOCK_EXIST" == "f" ]; then
        # 如果沒有鎖住了，那就不需要其他動作
        exit 1
    fi

    # 取消關機
    /sbin/shutdown -c 2> /dev/null

    # 通知
    echo $NBAS_ALERT_CANCEL | /usr/bin/wall 2> /dev/null

    # 刪除關機鎖
    rm -f $NBAS_LOCK

    # 完成恢復連線時動作

fi
