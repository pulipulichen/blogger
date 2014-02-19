#!/bin/bash

service cman stop
killall -9 corosync cman dlm_controld fenced
service pve-cluster stop
rm /etc/cluster/cluster.conf
rm -rf /var/lib/pve-cluster/* /var/lib/pve-cluster/.*
rm /var/lib/cluster/*
reboot