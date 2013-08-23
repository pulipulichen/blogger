HDD=/dev/sdc

# 歡迎訊息
echo "========================================="
echo "  HDD TO MooseFS ADDER"
echo "========================================="

# 請輸入要處理的硬碟編號
read -p "Please enter HDD device path: [/dev/sdb] " HDD
if [ -z $HDD ]; then
      vmid=/dev/sdb
fi

# 確認轉換項目
read -p "$HDD will be formated. Data will be clean. Are you sure? [y/N] " RESP
if [[ !("$RESP" == "y" || "$RESP" == "Y") ]]; then
  echo "Abort"
  exit 0
fi

# 1. 分割
echo "n
p
1


w" | fdisk $HDD

# 2. Sync device / 裝置同步

partprobe

# 3. Format / 格式化

PART="$HDD""1"
mkfs -t ext4 $PART

# 4. Get mount path / 取得mount路徑

DEV=`echo "/dev/sdc" |cut -d'/' -f 3` 
MOUNT_DIR="/mnt/mfschunk_$DEV""/"

# 5. Create directory / 建立目錄

umount $MOUNT_DIR
echo "umount $MOUNT_DIR"
rm -rf $MOUNT_DIR
echo "rm -rf $MOUNT_DIR"

mkdir -p $MOUNT_DIR
echo "mkdir -p $MOUNT_DIR"

# 6. Mount / 掛載

mount $PART $MOUNT_DIR
echo "mount $PART $MOUNT_DIR"

# 7. Change Owner / 修改擁有者

chown -R daemon:daemon $MOUNT_DIR
echo "chown -R daemon:daemon $MOUNT_DIR"

# 7. Add /etc/fstab / 加入 /etc/fstab

echo "$PART $MOUNT_DIR  ext4 defaults   1 1" >> /etc/fstab

# 8. Add configuration to mfshdd.cfg / 加入mfshdd.cfg設定

echo $MOUNT_DIR >> /etc/mfs/mfshdd.cfg

# 9. Restart mfschunkserver / 重新啟動mfschunkserver

mfschunkserver restart
