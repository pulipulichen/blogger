#!/bin/bash
# 
# /root/scripts/shutdown-other-nodes.sh
#
# History:
# 2013/09/06    Pudding <pulipuli.chen@gmail.com>   First release

RUNLV=`runlevel | cut -d ' ' -f 2`
if [ $RUNLV == 0 ]; then
    /root/scripts/pvecm-script.sh "halt"
fi