#!/bin/bash
#Author: Dominic Mages
#Simple Bash script to ping a list of servers and only output on fail
#(c) 2018

declare -A HOSTLIST
HOSTLIST[PC]=192.168.0.199 
HOSTLIST[Router]=192.168.0.1
HOSTLIST[DUMMY]=192.168.0.2
# echo 192.168.0.199 192.168.0.1 | xargs -n1 ping -w 1 | grep -b1 100   

echo Pinging hosts...
for K in "${!HOSTLIST[@]}"
do 
    echo Pinging $K - ${HOSTLIST[$K]}
done

for K in "${!HOSTLIST[@]}"
do 
    ping -c 1 -W 1 ${HOSTLIST[$K]} > /dev/null
    if [ $? -eq 0 ]; then
    echo "node $output is up" 
    else
    echo "node $output is down"
    fi
done