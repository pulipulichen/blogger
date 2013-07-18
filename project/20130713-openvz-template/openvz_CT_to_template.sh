#!/bin/bash
# Program:
#   For Proxmox VE (1~3). Convert OpenVZ Container to Template
#   在Proxmox VE (1到3版都可以使用)中，將OpenVZ的虛擬機器(Container)轉換成虛擬應用樣板(Template)
# History:
# 2013/07/13    Pulipuli Chen   First release

# 歡迎訊息
echo "========================================="
echo "  OpenVZ Container to Template Packager"
echo "========================================="

# 宣告目錄參數
container_dir=/var/lib/vz/private/
template_dir=/var/lib/vz/template/cache/
if [ ! -d $container_dir ] || [ ! -d $template_dir ]; then
    echo "This script only for Proxmox VE 1~3"
    echo "http://www.proxmox.com/downloads/category/iso-images-pve"
    echo "Abort"
    exit 0
fi

# 請輸入要轉換的VMID
read -p "Please enter OpenVZ container's VMID: [100] " vmid
if [ -z $vmid ]; then
      vmid=100
fi

# 回傳訊息，告知使用者要轉換的VMID
echo "You want to package container VMID $vmid to template"

# 宣告虛擬機器的目錄
ct_dir=$container_dir$vmid

# 檢查該VMID的虛擬機器是否存在
if [ -d $ct_dir ]; then

    # 如果存在的話
    
    # 詢問作業系統與其版本
    read -p "Please enter template's OS and version (ex: centos-5, debain-6.0, ubuntu-10.04): [centos-5] " template_os
    if [ -z $template_os ]; then
      template_os=centos-5
    fi
    until [[ "$template_os" == *"-"* ]]; do
        echo "Template's OS and version should include '-', ex: centos-5, debain-6.0, ubuntu-10.04. "
        read -p "Please enter template's OS and version again : [centos-5]" template_os
        if [ -z $template_os ]; then
          template_os=centos-5
        fi
    done

    # 詢問應用系統的名字
    read -p "Please enter template's application name (ex: standard, moodle, dspace-dlll): [custom] " name
    if [ -z $name ]; then
      name=custom
    fi
    until [[ "$name" != *"_"* ]]; do
        echo "Template's application name should NOT include '_', ex: standard, moodle, dspace-dlll."
        read -p "Please enter template's application name again : [custom] " name
        if [ -z $name ]; then
          name=custom
        fi
    done

    # 詢問應用系統的版本號
    read -p "Please enter template's application version (ex: 5.6-1, 10.04-4): [1.0-0] " version
    if [ -z $version ]; then
      version=1.0-0
    fi
    until [[ "$version" == *"."*"-"* ]]; do
        echo "Template's application version should include '.' and '-', ex: 5.6-1, 10.04-4."
        read -p "Please enter template's application version again : [1.0-0] " version
        if [ -z $version ]; then
          version=1.0-0
        fi
    done

    # 詢問樣板的架構
    read -p "Please enter template's architecture (arch.) (ex: i386): [i386] " template_arch
    if [ -z $template_arch ]; then
      template_arch=i386
    fi

    template_tar=${template_os}-${name}_${version}_${template_arch}.tar.gz

    # 確認轉換項目
    read -p "Do you wish to package container VMID $vmid to template $template_tar? [Y/n] " RESP
    if [ "$RESP" = "n" ]; then
      echo "Abort"
      exit 0
    fi

    # 檢查是否有同樣名稱的樣板
    template_path=${template_dir}${template_tar}
    if [ -d $template_path ]; then
        read -p "${template_tar} existed. Do you wish to overwrite it? [Y/n] " overwrite
        if [ "$overwrite" = "n" ]; then
            echo "Abort"
            exit 0
        fi
    fi

    # 停止運作中的虛擬機器
    echo "Stop VMID $vmid..."
    vzctl stop $vmid

    # 開始進行轉換
    echo "Change to directory $ct_dir"
    cd $ct_dir

    echo "Start to package VMID $vmid to template $template_tar"
    echo "Command: tar --overwrite -czvf ${template_path} ./" 
    tar --overwrite -czvf ${template_path} ./

    # 完成訊息
    echo "Package complete!"
    echo "You can use template $template_tar in your Proxmox VE now."
    echo "Template location path is $template_path"
else

    # 如果沒有該虛擬機器，則停止腳本檔
    echo "VMID $vmid not exist"
    echo "Abort"
fi