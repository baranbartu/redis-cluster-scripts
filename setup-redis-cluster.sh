#!/bin/sh
DEFAULT_REDIS_CONFIG='/usr/local/etc/redis.conf'
CLUSTER_CONFIG_PATH='/usr/local/etc/redis-cluster/'
PORTS=('6376' '6377' '6378' '6380')

echo "################################################"
echo "########### Redis CLuster Setup  ###############"
echo "################################################"

sleep 1

echo

echo "======================================================================="
echo "All redis instances will be killed and flushed all databases in Redis."
echo "======================================================================="

sleep 1

pkill -f redis-server
sleep 1
redis-server ${DEFAULT_REDIS_CONFIG} &
sleep 1
redis-cli flushall

sleep 1

echo

echo "======================================================================="
echo "redis-cluster config path will be also removed if exists."
echo "======================================================================="

rm -rf ${CLUSTER_CONFIG_PATH}

sleep 1

echo

echo "======================================================================="
echo "redis-cluster config path will be created with related config files."
echo "======================================================================="

if [ ! -d ${CLUSTER_CONFIG_PATH} ]; then
    mkdir ${CLUSTER_CONFIG_PATH}
fi

sleep 1

echo

echo "======================================================================="
echo "Redis instances will be executing on different ports to use with cluster."
echo "======================================================================="

sleep 1

echo

CLUSTER_INSTANCES=""

for port in "${PORTS[@]}"
    do
        CONF="$CLUSTER_CONFIG_PATH$port.conf"
        if [ ! -f ${CONF} ]; then
            cp ${DEFAULT_REDIS_CONFIG} ${CONF}
            echo "cluster-node-timeout 5000" > temp_file.conf
            cat ${CONF} >> temp_file.conf
            mv temp_file.conf ${CONF}
            echo "cluster-config-file $port.conf" > temp_file.conf
            cat ${CONF} >> temp_file.conf
            mv temp_file.conf ${CONF}
            echo "cluster-enabled yes" > temp_file.conf
            cat ${CONF} >> temp_file.conf
            mv temp_file.conf ${CONF}

            redis-server ${CONF} --port ${port} &

            redis-cli -p ${port} flushall

            sleep 1

            ruskit destroy localhost:${port}

            sleep 1

            CLUSTER_INSTANCES+=" 127.0.0.1:$port"

            sleep 1
        fi
    done

echo

echo "======================================================================="
echo "Cluster is creating ..."
echo "======================================================================="

sleep 1

echo

ruskit create -m ${#PORTS[@]} ${CLUSTER_INSTANCES}
