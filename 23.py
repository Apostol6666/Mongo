from pymongo import MongoClient
client = MongoClient()
db = client.bigdata
collection=db.bigdata

print (db.bigdata.count({"$and": [{"century": {"$in": [14,15]}},{"poet": {"$exists": "true"}}]}))

for every in collection.find({"$and": [{"century": {"$in": [14,15]}},{"poet": {"$exists": "true"}}]}).limit(350):
    post_id = every["_id"]
    collection.update_one({'_id':post_id}, {"$set": {'poet': 'Da Vinci'}}, upsert=False)
   
     
