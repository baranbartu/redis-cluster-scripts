# redis-cluster-scripts

Redis Cluster Development Environment Setup Scripts for Basic Usage

You can basically run these scripts to run and observe redis-cluster 
in your local development environment

# Pre-Requirements

**ruskit**

    pip install ruskit

ruskit is redis-cluster administration toolkit which was developed with Python.

**watch**

    brew install watch

watch, execute a program periodically.

# Execute scripts in order

    chmod +x setup-redis-cluster
    chmod +x watch-redis-cluster
    ./setup-redis-cluster
    watch -d -n 1 "ruskit info localhost:6376;./watch-redis-cluster.sh"

# Connection

You can connect from any application which is independent with programming language. 
Currently [this](http://redis.io/topics/cluster-tutorial#playing-with-the-cluster) link explains which clients exist.

# Screenshot

![ScreenShot](https://raw.github.com/baranbartu/redis-cluster-scripts/master/screenshot.png)


