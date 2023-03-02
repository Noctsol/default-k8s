#!/usr/bin/python3

"""
Test script to connect to a kafka topic


"""

from confluent_kafka import Consumer
import quikenv
import json
env = quikenv.ezload()


# Test
bootstrap_srv = env.get("kfurl")
user_key = env.get("kfkey")
user_secret = env.get("kfsecret")
subscibed_topics = [env.get("kftopic")]

# Determines amount of messages we'll pull
consumer_count = 20

c = Consumer({
    'bootstrap.servers': bootstrap_srv,
    'group.id': 'test-python-jumpbox',
    'client.id': 'local-python-script-jump',
    'auto.offset.reset': 'earliest',
    'sasl.username': user_key,
    'sasl.password': user_secret,
    'security.protocol': 'SASL_SSL',
    'sasl.mechanisms': 'PLAIN'
})

c.subscribe(subscibed_topics)

for i in range(consumer_count):
    if i == 0:
      print("Started")

    msg = c.poll(1.0)

    if i == 0:
      print("Poll success")

    if msg is None:
        continue
    if msg.error():
        print("Consumer error: {}".format(msg.error()))
        continue

    print("------------------------ Received message ------------------------ ")

    mymsg = msg.value().decode('utf-8')

    try:
      myjson = json.loads(mymsg)
      print(myjson)

    except Exception:
      print(mymsg)


c.close()