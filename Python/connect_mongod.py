# connect using the pymongo
from pymongo import MongoClient


# choice 4: find engine size
def call_query(engine):
    with MongoClient() as client:
        engine = float(engine)
        db = client.get_database("mongo")
        coll = db.get_collection("docs")

        for col in coll.find({"car.engineSize": engine}):
          print (col["_id"] , ":",  col["car"]["reg"],":",  col["car"]["engineSize"] , ":", col["addresses"])

        
# choice 5: adding a car to the database
def addCar(car_id, reg, engine):
      with MongoClient() as client:
        engine = float(engine)
        db = client.get_database("mongo")
        coll = db.get_collection("docs")
        print(car_id, reg, engine)
        coll.insert_one({'_id' : car_id, 'car':{'reg':reg, 'engineSize':engine}, 'addresses':[] })
        #show 
        for col in coll.find({"_id": car_id}):
          print ("Great! You've just added: ", col["_id"] , ":",  col["car"]["reg"],":",  col["car"]["engineSize"] )
          
          
 
      
# { "_id" : 3, "car" : { "reg" : "142-G-28", "engineSize" : 1 }, "addresses" : [ "MO", "G", "WH" ] }     