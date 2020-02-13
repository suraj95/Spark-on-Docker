# Start Spark Cluster
Currently supports one master and three workers, will keep updating as I make progress, like being able dynamically scale workers up and down.

The docker-compose.yml refers to two important properties, namely ports and expose

Ports mentioned will be shared among different services started by the docker-compose. Ports will be exposed to the host machine to a random port or a given port. Activates the container to listen for specified port(s) from the world outside of the docker(can be same host machine or a different machine) AND also accessible world inside docker.

Expose basically "exposes" ports without publishing them to the host machine - they’ll only be accessible to linked services. Only the internal port can be specified. Activates container to listen for a specific port only from the world inside of docker AND not accessible world outside of the docker.

	./build_images.sh

Spark master is application that coordinates resources allocation from slaves. Master does not perform any computations. Master is just a resource manager. And Spark worker is application on worker node which coordinates resources on given worker node.Finally, Spark executor is application created by spark worker which performs tasks on worker node for driver.

Master will be running at localhost:8080 and workers will be running at localhost:8081, localhost:8082 and localhost:8083 respectively (refer to screenshots folder). I have currently just manually copy pasted configurations in the docker-compose file for each worker, but there should be a more efficient way to do this. 


# Running Spark Applications
We connect to the container running the Master worker as follows

	docker exec -it spark-on-docker_master_1 /bin/bash 

# Scala Examples
	
	# 1. Calculate the Value of Pi
	bin/run-example SparkPi 10
	# 2. Linear regression with elastic-net (mixing L1/L2) regularization
	bin/run-example ml.LinearRegressionExample --regParam 0.15 --elasticNetParam 1.0 data/mllib/sample_linear_regression_data.txt

# Python Examples

	# 1. Calculate the number of words in a text file
	bin/spark-submit examples/src/main/python/wordcount.py data/mllib/images/license.txt

	# 2. Calculate the Pagerank for a bunch of web page urls 
	bin/spark-submit examples/src/main/python/pagerank.py data/mllib/pagerank_data.txt 10

	# 3. Demonstrate K-means clustering and calculate euclidian distance (requires numpy)
	bin/spark-submit examples/src/main/python/ml/kmeans_example.py

	# 4. An ML Pipeline which consists of three stages: tokenizer, hashingTF, and logistic regression.
	bin/spark-submit examples/src/main/python/ml/pipeline_example.py

	# 5. A Multilayer Perceptron Classifier with four layers: input layer of 4 features, two intermediate layers (size of 5 and 4), and finally an output layer of 3 classes
	bin/spark-submit examples/src/main/python/ml/multilayer_perceptron_classification.py

# We may have to run some commands on worker nodes (install new packages)
	
	docker exec -it spark-on-docker_worker_1 /bin/bash

	# After worker nodes starts, we can access its shell and post commands
	pip install numpy


# Stop and Remove all running containers

	docker stop $(docker ps -a -q)
	docker rm $(docker ps -a -q)


# Clean up network
Despite stopping and removing previous containers, you may get issues like "port is already allocated". So it is good practice to run this command as it removes previously used networks. You may have to restart Docker desktop if issue still persists.

	docker-compose down
