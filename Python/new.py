from pymongo import MongoClient



connection = MongoClient('localhost', 27017)
    #print(connection.database_names())
database = connection.mongo #accessing the db, similar to use <db>
collection = database.docs

