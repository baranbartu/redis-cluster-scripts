#!/bin/bash

PORTS=('6376' '6377' '6378' '6380')

echo

for port in "${PORTS[@]}"
    do
        echo ${port}
        echo =============================
        redis-cli -p ${port} info keyspace
        echo
    done

echo 
echo ========== Non Clustered Redis Instance ==========
echo 
echo 6379
echo =============================
redis-cli -p 6379 info keyspace
echo
