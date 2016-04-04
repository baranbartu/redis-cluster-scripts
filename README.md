# redis-cluster-scripts

Redis Cluster Setup and Observation Scripts

You can basically run these scripts to run and observe redis-cluster 
in your local development environment

# Pre-Requirements

**redis-clu**

    pip install redis-clu

redis-clu is redis-cluster management toolkit which was developed with Python. We' ll be setuping redis-cluster using redis-clu. It supports adding/deleting new node to cluster, and also supports resharding.

**watch**

    brew install watch

Execute a program periodically with 'watch'. We' ll be observing our cluster with watch. Watch script has all nodes with key/slot distribution, keyspace info of each node and master/slave relationships on the cluster.

# Execute scripts in order

    chmod +x setup-redis-cluster
    chmod +x watch-redis-cluster
    ./setup-redis-cluster
    watch -d -n 1 "redis-clu status localhost:6376"

# Connection

You can connect from any application which is independent with programming language. 
Currently [this](http://redis.io/topics/cluster-tutorial#playing-with-the-cluster) link explains which clients exist.

# Screenshot

![ScreenShot](https://raw.github.com/baranbartu/redis-cluster-scripts/master/screenshot.png)


