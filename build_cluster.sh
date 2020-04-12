#!/bin/bash

# Spark Configuration Variables (memory, instance, cores)

# SPARK_WORKER_MEMORY: The System memory to be used by worker for creating executors on node. 
# SPARK_MASTER_MEMORY: The memory for master should not be too high.
# SPARK_WORKER_CORES: The total number of cores to be used by executors by each worker.
# SPARK_WORKER_INSTANCES: The number of workers per worker node.

NUM_OF_WORKERS=3   #Ideally, this should be the number of cores on your machine

docker-compose up --build --scale worker=$NUM_OF_WORKERS # use --build before --scale to force a rebuild


# Simply restarting a container doesn't make Docker use a new image, when the image was rebuilt in the 
# meantime. Instead, Docker is fetching the image only before running the container. So the state after 
# running a container is persistent.

# That is why storing data in containers is considered as bad practice because a container has to be 
# destroyed to update applications, the stored data inside would be lost too. This causes extra work to 
# shutdown services, backup data and so on. So it's a smart solution to exclude those data completely 
# from the container: We don't have to worry about our data, when its stored safely on the host and 
# the container only holds the application itself. The most we can do is cache our most frequently used
# data using Redis.