#!/usr/bin/python3

import pymongo
import quikenv
import random
from datetime import datetime
import helpu
import time

env = quikenv.ezload()


# Test
mongo_pass = env.get("mongo_pass")


myclient = pymongo.MongoClient(
    f"mongodb+srv://mongoadmin:{mongo_pass}@devmongo.wfyvyof.mongodb.net/?retryWrites=true&w=majority")
mydb = myclient["test"]
mycol = mydb["fromk8s"]



mycolrand= mydb["random"]

nouns = ["a cat", "a dog", "a rainbow", "a dog", "a person", "a jungle",
         "a blade of grass", "the universalist", "a shadow", "your friendly drug dealer"]
transitions = ["is going to be", "is", "will", "was", "could be"]
actions = ["fighting", "jumping", "flying over the rainbow",
           "succintly explaining howw much you suck", "dancing with many partners", "dancing the death death"
           "leaving the vicinity", "tiring of you"
           ]
fnames = ["Joni", "Kevlar", "Rikity", "Unon", "Stacy"]
mnames = ["Strongest", "Weakest", "Poopy", "Small", "Piton"]
lnames = ["Grand", "Perkith", "Booden", "Amascus", "Destith"]

for i in range(100):
    mynoun = random.choice(nouns)
    mytrans = random.choice(transitions)
    myactions = random.choice(actions)

    fname = random.choice(fnames)
    mname = random.choice(mnames)
    lname = random.choice(lnames)

    mydict = {"create_datetime": str(datetime.utcnow().isoformat()),
              "profile": {"name": f"{fname} {mname} {lname}",
                          "description": f"{mynoun} {mytrans} {myactions}"},
              "integrity_of_reality": random.randint(0, 100)
              }

    print(mydict)
    result = mycol.insert_one(mydict)
    result_2 = mycolrand.insert_one(mydict)

    time.sleep(30)

# mydict = { "name": "John", "address": "Highway 37" }

# x = mycol.insert_one(mydict)
