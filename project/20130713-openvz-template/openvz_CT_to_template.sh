#!/bin/bash
# Program:
#   For Proxmox VE (1~3). Convert OpenVZ Container to Template
#   在Proxmox VE (1到3版都可以使用)中，將OpenVZ的虛擬機器(Container)轉換成虛擬應用樣板(Template)
# History:
# 2013/07/13    Pulipuli Chen   First release

# 歡迎訊息
echo "================================"
echo "  OpenVZ Container to Template"
echo "================================"

# 請輸入要轉換的VMID
read -p "Please enter OpenVZ Container's VMID: [100] " vmid
if [ -z $vmid ]; then
      vmid=100
fi

# 回傳訊息，告知使用者要轉換的VMID
echo "You want to convert Container VMID $vmid"

# 宣告目錄參數
container_dir=/var/lib/vz/private/
ct_dir=$container_dir/$vmid
template_dir=/var/lib/vz/template/cache/

# 檢查該VMID的虛擬機器是否存在
if [ -d $ct_dir ]; then

    # 如果存在的話
    
    read -p "Please enter template OS (ex: centos-5, debain-6.0, ubuntu-10.04): [centos-5] " template_os
    if [ -z $template_os ]; then
      template_os=centos-5
    fi
    until [[ "$template_os" == *"-"* ]]; do
        echo "Template OS should include '-', ex: centos-5, debain-6.0, ubuntu-10.04. "
        read -p "Please enter template OS again : [centos-5]" template_os
        if [ -z $template_os ]; then
          template_os=centos-5
        fi
    done

    read -p "Please enter template name (ex: standard, moodle, dspace-dlll): [custom] " name
    if [ -z $name ]; then
      name=custom
    fi
    until [[ "$name" != *"_"* ]]; do
        echo "Template name should NOT include '_', ex: standard, moodle, dspace-dlll."
        read -p "Please enter template name again : [custom] " name
        if [ -z $name ]; then
          name=custom
        fi
    done

    read -p "Please enter template version (ex: 5.6-1, 10.04-4): [1.0-0] " version
    if [ -z $version ]; then
      version=1.0-0
    fi
    until [[ "$version" == *"."*"-"* ]]; do
        echo "Template version should include '.' and '-', ex: 5.6-1, 10.04-4."
        read -p "Please enter template version again : [1.0-0] " version
        if [ -z $version ]; then
          version=1.0-0
        fi
    done

    read -p "Please enter template arch. (ex: i386): [i386] " template_arch
    if [ -z $template_arch ]; then
      template_arch=i386
    fi

    template_tar=${template_os}-${name}_${version}_${template_arch}.tar.gz

    read -p "Do you wish to convert VMID $vmid to $template_tar? [Y/n] " RESP
    if [ "$RESP" = "n" ]; then
      echo "Abort"
      exit 0
    fi

    template_path=${template_dir}${template_tar}
    if [ -d $template_path ]; then
        read -p "${template_tar} existed. Do you wish to overwrite it? [Y/n] " overwrite
        if [ "$overwrite" = "n" ]; then
            echo "Abort"
            exit 0
        fi
    fi

    echo "Stop VMID $vmid..."
    vzctl stop $vmid

    echo "Package VMID $vmid to template..."
    # /var/lib/vz/template/cache/centos-5-standard_5.6-1-dspace-dlll.tar.gz
    cd $ct_dir
    tar -czvf --overwrite ${template_path} ./ 
else
    echo "VMID $vmid not exist"
    echo "Abort"
fi