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