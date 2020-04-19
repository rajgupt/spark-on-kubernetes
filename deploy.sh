kubectl create namespace spark
kubectl create serviceaccount spark -n spark
kubectl create clusterrolebinding spark-role --clusterrole=edit --serviceaccount=spark:spark --namespace=spark

kubectl apply -f pv.yaml -n spark
kubectl apply -f pvc.yaml -n spark
kubectl apply -f deploy.yaml -n spark
kubectl port-forward deployment/pyspark-deployment -n spark 9000:8888