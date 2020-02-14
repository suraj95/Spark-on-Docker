#!/bin/bash

# Spark Configuration Variables (memory, instance, cores)

# SPARK_WORKER_MEMORY: The System memory to be used by worker for creating executors on node. 
# SPARK_MASTER_MEMORY: The memory for master Should not be too high.
# SPARK_WORKER_CORES: The total number of cores to be used by executors by each worker
# SPARK_WORKER_INSTANCES: The number of workers per worker node.

docker-compose up

