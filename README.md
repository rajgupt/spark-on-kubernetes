# spark-on-kubernetes

Local Spark Cluster Setup using Kubernetes on Docker-Desktop

References: 
- [Ignite the spark](https://towardsdatascience.com/ignite-the-spark-68f3f988f642)
- [Olx Blog on Spark Setup](https://tech.olx.com/running-spark-on-kubernetes-a-fully-functional-example-and-why-it-makes-sense-for-olx-d56b6a61fcbe)
- https://github.com/olx-global/spark-on-k8s
- http://blog.brainlounge.de/memoryleaks/getting-started-with-spark-on-kubernetes/

Steps:
1. Activate kubernetes on docker desktop.
2. Install kubectl
3. Setup the local docker registry
4. Build Spark Images for Kubernetes Deployment (see [Olx Blog on Spark Setup](https://tech.olx.com/running-spark-on-kubernetes-a-fully-functional-example-and-why-it-makes-sense-for-olx-d56b6a61fcbe))
5. Push images in docker registry

## Commands 

```bash
$SPARK_HOME/bin/spark-submit \
    --master k8s://https://kubernetes.docker.internal:6443 \
    --deploy-mode cluster \
    --name spark-pi \
    --class org.apache.spark.examples.SparkPi \
    --conf spark.executor.instances=2 \
    --conf spark.kubernetes.container.image=localhost:30000/spark \
    $SPARK_HOME/examples/jars/spark-examples_2.11-2.4.5.jar
```

### Driver Setup
Setup the pyspark driver according to [Ignite the spark](https://towardsdatascience.com/ignite-the-spark-68f3f988f642)

