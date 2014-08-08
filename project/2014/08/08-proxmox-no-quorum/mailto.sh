#!/bin/bash
# Path: /root/pulipuli_scripts/mailto.sh
# 
# 寄送郵件
# 

# 讀取寄送者資料
base_dir=${PWD}
source $base_dir/pve_config.conf

# 寄送郵件的地址
#$mail_to_address
#$mail_from_address

# 避免範例設定寄出郵件
if [ "$mail_to_address" = "example@example.edu.tw" -a -z "$mail_to_address" ];then
    exit
fi

# 節點類別
key=$1

# 設定信件標題
subject_key=mail_subject_$key
subject=${!subject_key}
message_key=mail_message_$key
message=${!message_key}

# 避免無效設定
if [ -z "$subject" ];then
    echo "Email configuration note found ($key)"
    exit
fi

# 取得必要資訊

# 節點名稱
nodename=`$base_dir/find_current_node_name.sh`
# 節點位址
nodeaddress=`$base_dir/find_current_node_address.sh`

# 替換字數
subject="${subject/\[NODE_NAME\]/$nodename}"
subject="${subject/\[NODE_ADDRESS\]/$nodeaddress}"
message="${message/\[NODE_NAME\]/$nodename}"
message="${message/\[NODE_ADDRESS\]/$nodeaddress}"
mail_from_address="${mail_from_address/\[NODE_NAME\]/$nodename}"

# 寄送郵件
echo -e $message | mail -s "$subject" "$mail_to_address" -aFrom:$mail_from_address
#echo "Mail from address: $mail_from_address"
#echo "Mail to address: $mail_to_address"
#echo "Mail subject: $subject"
#echo "Mail message: $message"
