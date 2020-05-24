#!/usr/bin/perl
print "use bigdata\ndb.bigdata.remove({})\n";

while($line=<STDIN>)
 {
  $line=~ s/\n//g;
  @d=split(/\;\s+/,$line);
  @z0=split(/\:/,@d[0]);
  @z1=split(/\:/,@d[1]);
  @z2=split(/\:/,@d[2]);
  if(@d[2])
   {print "db.bigdata.insert({@z0[0]:'@z0[1]',@z1[0]:@z1[1],@z2[0]:@z2[1]})\n"; }
  else
   {
   if(@d[1])
    { print "db.bigdata.insert({@z0[0]:'@z0[1]',@z1[0]:@z1[1]})\n"; }        
   else
    { print "db.bigdata.insert({@z0[0]:'@z0[1]'})\n"; }
   }
}

from pymongo import MongoClient
client = MongoClient()
db = client.bigdata
collection=db.bigdata
post = {"author": "Mike",   "text": "My first blog post!","tags": ["mongodb", "python", "pymongo"]}post_id=collection.insert_one(post).inserted_id
print(post_id)

print(collection.find_one({"author": "Mike"}))

print(collection.find_one({"uname": {"$exists": "true"}}))

print(collection.find_one({"century": {"$gt": 18}}))

print(collection.find_one({"century": {"$lt": 18}}))for auth in collection.find({"century": {"$gt": 18}}).sort("uname"):
    print (auth)

collection.update_one({'_id':post_id}, {"$set": {'post': 'good', 'text': 'changed'}}, upsert=False)

collection.update_many({'author': {"$exists":True}}, {"$set": {'post': 'good4', 'text': 'changed4'}}, upsert=False)

