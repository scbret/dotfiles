#!/bin/bash
virsh --connect qemu:///system start win11
sleep 30
#xfreerdp3 /u:sbret /p:93stratos39 /size:100% /sound /v:192.168.122.248
xfreerdp3 /f /u:sbret /p:93stratos39 /sound /v:192.168.122.248
