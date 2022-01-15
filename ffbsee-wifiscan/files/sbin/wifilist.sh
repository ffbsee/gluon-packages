#!/bin/sh

function wifilist()
{
    iw dev | grep "Interface" | grep -v "mesh" | sed 's/.*Interface\|//' | while read device
    do
        iw dev $device scan lowpri | awk -f wlan_scan.awk
    done
}
result="["$(wifilist|sed '$s/,$//')"]"
echo $result
