# Confluent Kakfa Connect
This has been by far one of my most frustrating experiences setting up something on k8s.
The amount of digging I had to do get this to work was insane.

When looking at examples, if you see that they are not connecting to a **cloud** instance.
Ignore it.

Even the stupid secrets have to be a specific key **and** a specific value format.
And you won't know any of this up until you try deploying the any of this crap.
If you see anything that has an endpoint like "http://schemaregistry.confluent.svc.cluster.local:8081" or
"kafka:9071", ignore it. They are using a k8s deployed kafka cluster.


# URLS with useful examples
git hub search https://github.com/search?q=%22kind%3A+Connector%22+%22apiVersion%3A+platform.confluent.io%2Fv1beta1%22&ref=simplesearch&type=code

## Connect Resource
These actually show more options and how to structure the manifests yaml
- https://github.com/confluentinc/confluent-kubernetes-examples/blob/5a2a373bc0a39bf62193c19a7953df0655570b46/hybrid/ccloud-connect-confluent-hub/kafka-connect.yaml
- https://github.com/confluentinc/confluent-kubernetes-examples/blob/db49fb96621a02e9ca30532e516acdcd499ddf0c/hybrid/ccloud-JDBC-mysql-mountedVolumes/kafka-connect.yaml
- https://github.com/confluentinc/confluent-kubernetes-examples/blob/5a2a373bc0a39bf62193c19a7953df0655570b46/hybrid/replicator-cloud2cloud/components-destination.yaml
- https://github.com/confluentinc/confluent-kubernetes-examples/blob/5a2a373bc0a39bf62193c19a7953df0655570b46/hybrid/ccloud-JDBC-mysql/kafka-connect.yaml
- https://github.com/confluentinc/confluent-kubernetes-examples/blob/5a2a373bc0a39bf62193c19a7953df0655570b46/connector/replicator-source-connector/confluent-platform-destination.yaml
- https://github.com/confluentinc/confluent-kubernetes-examples/blob/5a2a373bc0a39bf62193c19a7953df0655570b46/security/plaintext-basic-auth-ConnectAndSchemaRegistry/confluent-platform.yaml
- https://github.com/confluentinc/confluent-kubernetes-examples/blob/5a2a373bc0a39bf62193c19a7953df0655570b46/networking/external-access-load-balancer-deploy/confluent-platform.yaml

##### Contains TLS Certs

- https://github.com/confluentinc/confluent-kubernetes-examples/blob/5a2a373bc0a39bf62193c19a7953df0655570b46/security/openshift-security/confluent-platform-with-defaultSCC.yaml
- https://github.com/confluentinc/confluent-kubernetes-examples/blob/5a2a373bc0a39bf62193c19a7953df0655570b46/networking/external-access-nodeport-deploy/confluent-platform.yaml
- https://github.com/confluentinc/confluent-kubernetes-examples/blob/5a2a373bc0a39bf62193c19a7953df0655570b46/security/configure-with-vault/rbac/confluent-platform-withrbac-vault.yaml
- https://github.com/confluentinc/confluent-kubernetes-examples/blob/5a2a373bc0a39bf62193c19a7953df0655570b46/security/configure-with-vault/confluent-platform-norbac-vault.yaml
- https://github.com/confluentinc/confluent-kubernetes-examples/blob/5a2a373bc0a39bf62193c19a7953df0655570b46/security/production-secure-deploy/confluent-platform-production-mtls.yaml

### Contains jvm override
- https://github.com/confluentinc/confluent-kubernetes-examples/blob/5a2a373bc0a39bf62193c19a7953df0655570b46/hybrid/replicator-source-ccloud-destCFK-tls/components-destination.yaml

### Contains probe settings
- https://github.com/confluentinc/confluent-kubernetes-examples/blob/5a2a373bc0a39bf62193c19a7953df0655570b46/quickstart-deploy/confluent-platform-singlenode.yaml

### Contains schema registry access
https://github.com/confluentinc/confluent-kubernetes-examples/blob/f251ca828bed606abada1dfd47e6f537351d05cf/hybrid/ccloud-integration/confluent-platform.yaml

### From github
- https://github.com/rohits-dev/ccloud-hybrid-monitoring-governance/blob/855aa4793c251853c29cd2f63d380507a9e48866/01_confluent/connect.yaml


# Connector with actual examples
- https://github.com/confluentinc/confluent-kubernetes-examples/blob/fad1ba3d5bff05698a0857ba6953065aed953149/hybrid/replicator-source-ccloud-destCFK-tls/connector.yaml
- https://github.com/confluentinc/confluent-kubernetes-examples/blob/fad1ba3d5bff05698a0857ba6953065aed953149/hybrid/replicator/connector.yaml
- https://github.com/confluentinc/confluent-kubernetes-examples/blob/fad1ba3d5bff05698a0857ba6953065aed953149/hybrid/replicator-cloud2cloud/connector.yaml
- https://github.com/confluentinc/confluent-kubernetes-examples/blob/42d83fae032ccea4e2ee417dbb8b8d8588fdec66/blueprints-early-access/scenarios/cp-rbac-mtls-lb/cp-apps/connectors/connector_ms.yaml
- https://github.com/confluentinc/confluent-kubernetes-examples/blob/99210f974c7137e509948f242dceb516de22efaf/connector/hdfs3-sink-connector/connector.yaml
- https://github.com/confluentinc/confluent-kubernetes-examples/blob/0dc9e759f316382c4a154e5bd4e133bb64fa3155/connector/http-sink-connector/httpsinkconnector.yaml
- https://github.com/confluentinc/confluent-kubernetes-examples/blob/0f99bc7f3aaa7aafb709f5f76272fac024d81af1/hybrid/ccloud-JDBC-mysql/connector.yaml
- https://github.com/confluentinc/confluent-kubernetes-examples/blob/db49fb96621a02e9ca30532e516acdcd499ddf0c/hybrid/ccloud-JDBC-mysql-mountedVolumes/connector.yaml

## From github
- https://github.com/rohits-dev/ccloud-hybrid-monitoring-governance/blob/855aa4793c251853c29cd2f63d380507a9e48866/07_connectors/mysql-source-accounts.yaml
- https://github.com/ThinkportRepo/big-data-on-k8s-workshop/blob/17bfb7cc93496e38fa9406e54834bc1d86f159d9/1_setup/4_kafka/crds/connector-twitter.yaml#L4

### Mongo connector examples
- https://github.com/rohits-dev/ccloud-hybrid-monitoring-governance/blob/855aa4793c251853c29cd2f63d380507a9e48866/07_connectors/mongo-sink-txns.yaml#L4
- https://github.com/rohits-dev/ccloud-hybrid-monitoring-governance/blob/855aa4793c251853c29cd2f63d380507a9e48866/07_connectors/mongo-sink-accounts.yaml#L4

### Elastic
- https://github.com/hyperconnect/hyperconnect.github.io/blob/42462a3b88994c9bbf1a1466e6b5ed4bdc137765/_posts/2022-10-14-grafana-with-ksqlDB.md?plain=1#L101
-


# Random info
ElasticsearchSink
MongoDbAtlasSource

confluent-hub install mongodb/kafka-connect-mongodb:1.9.1
confluentinc/kafka-connect-elasticsearch:latest

Elastic
https://docs.confluent.io/cloud/current/connectors/cc-elasticsearch-service-sink.html#step-3-create-the-connector-configuration-file

mongo
https://docs.confluent.io/cloud/current/connectors/cc-mongo-db-source.html#step-3-create-the-connector-configuration-file

https://www.confluent.io/blog/declarative-connectors-with-confluent-for-kubernetes/#how-does-it-work

https://github.com/confluentinc/confluent-kubernetes-examples/blob/master/connector/hdfs3-sink-connector/confluent-platform.yaml
https://github.com/confluentinc/confluent-kubernetes-examples/blob/0f99bc7f3aaa7aafb709f5f76272fac024d81af1/hybrid/ccloud-JDBC-mysql/kafka-connect.yaml


kubectl logs -f connect-0 -c config-init-container
kubectl logs -f connect-0 --tail=100
kubectl logs -f connect-0 --since=1h


--since=1h
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