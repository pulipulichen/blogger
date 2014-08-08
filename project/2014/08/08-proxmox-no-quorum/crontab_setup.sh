#!/bin/bash
# Path: /root/pulipuli_scripts/crontab_setup.conf
# 
# 把設定加入crontab中
# 
# 參數
# $1 指令
# $2 每日執行的時間，從1-24


cmd="$1"
hour="$2"

# 輸入指令無效
if [ -z "$cmd" -o -z "$hour" ];then
    echo "Command or hour parameters missed"
    exit
fi

# "0 $hour * * * root $cmd"

result=`cat /etc/crontab | grep "0 $hour * * * root $cmd"`
if [ -z "$result" ];then
    # 如果是空值，加入設定
    echo "0 $hour * * * root $cmd" >> /etc/crontab
fi