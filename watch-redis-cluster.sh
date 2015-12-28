#!/bin/bash

PORTS=('6376' '6377' '6378')

echo

for port in "${PORTS[@]}"
    do
        echo ${port}
        echo =============================
        redis-cli -p ${port} info keyspace
        echo
    done