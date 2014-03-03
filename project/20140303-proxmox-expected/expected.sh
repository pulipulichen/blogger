#!/bin/sh

service pvestatd stop
service pvedaemon stop
service cman stop
service pve-cluster stop

service pve-cluster start
service cman start
service pvedaemon start
service pvestatd start

pvecm expected 1
