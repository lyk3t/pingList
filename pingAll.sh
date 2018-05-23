#!/bin/bash
#Author: Dominic Mages
#Simple Bash script to ping a list of servers and only output on fail
#(c) 2018

RED='\033[0;31m'
NC='\033[0m' # No Color
timestamp() {
  date +"%T"
} 

declare -A HOSTLIST

# List of hosts to be pinged 
HOSTLIST[PC]=192.168.0.199 
HOSTLIST[Router]=192.168.0.1
HOSTLIST[DUMMY]=192.168.0.2
# echo 192.168.0.199 192.168.0.1 | xargs -n1 ping -w 1 | grep -b1 100  

echo Pinging hosts in loop...
echo Press CTRL + C to interrupt the script
echo
echo Following hosts will be pinged:
for K in "${!HOSTLIST[@]}"
do 
    echo $K - ${HOSTLIST[$K]}...
done

while :
do
    for K in "${!HOSTLIST[@]}"
    do 
        ping -c 1 -W 1 ${HOSTLIST[$K]} > /dev/null
        if [ $? != 0 ]; then
        echo -e "$(timestamp): ${RED}$K: Host not reachable!${NC}" 
        fi
    done
    sleep 1;
done