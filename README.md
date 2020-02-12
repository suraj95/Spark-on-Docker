
# Start Spark Cluster

docker-compose up --scale worker=[NUM_WORKERS]

# Running Spark Applications

docker exec -it spark-on-docker_master_1 /bin/bash 

	# After Master node starts, we can submit Spark jobs as follows

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

docker-compose down
