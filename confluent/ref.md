# ElasticsearchSink
# MongoDbAtlasSource

# confluent-hub install mongodb/kafka-connect-mongodb:1.9.1
# confluentinc/kafka-connect-elasticsearch:latest

# Elastic
# https://docs.confluent.io/cloud/current/connectors/cc-elasticsearch-service-sink.html#step-3-create-the-connector-configuration-file


# mongo
# https://docs.confluent.io/cloud/current/connectors/cc-mongo-db-source.html#step-3-create-the-connector-configuration-file

# https://www.confluent.io/blog/declarative-connectors-with-confluent-for-kubernetes/#how-does-it-work



# https://github.com/confluentinc/confluent-kubernetes-examples/blob/master/connector/hdfs3-sink-connector/confluent-platform.yaml
# https://github.com/confluentinc/confluent-kubernetes-examples/blob/0f99bc7f3aaa7aafb709f5f76272fac024d81af1/hybrid/ccloud-JDBC-mysql/kafka-connect.yaml
# kubectl logs -f connect-0 -c config-init-container

kubectl apply -k confluent/overlays/

[ERROR] 2023-02-27 05:50:07,995 [main] org.apache.kafka.connect.cli.ConnectDistributed main - Stopping due to error
org.apache.kafka.connect.errors.ConnectException: Failed to connect to and describe Kafka cluster. Check worker's broker connection and security properties.
        at org.apache.kafka.connect.util.ConnectUtils.lookupKafkaClusterId(ConnectUtils.java:79)
        at org.apache.kafka.connect.util.ConnectUtils.lookupKafkaClusterId(ConnectUtils.java:60)
        at org.apache.kafka.connect.cli.ConnectDistributed.startConnect(ConnectDistributed.java:96)
        at org.apache.kafka.connect.cli.ConnectDistributed.main(ConnectDistributed.java:79)
Caused by: java.util.concurrent.ExecutionException: org.apache.kafka.common.errors.TimeoutException: Timed out waiting for a node assignment. Call: listNodes
        at java.base/java.util.concurrent.CompletableFuture.reportGet(CompletableFuture.java:395)
        at java.base/java.util.concurrent.CompletableFuture.get(CompletableFuture.java:1999)
        at org.apache.kafka.common.internals.KafkaFutureImpl.get(KafkaFutureImpl.java:165)
        at org.apache.kafka.connect.util.ConnectUtils.lookupKafkaClusterId(ConnectUtils.java:73)
        ... 3 more
Caused by: org.apache.kafka.common.errors.TimeoutException: Timed out waiting for a node assignment. Call: listNodes
