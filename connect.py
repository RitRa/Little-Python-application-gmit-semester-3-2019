import pymysql.cursors


# Connect to the database
conn = pymysql.connect(host='localhost',
                             user='root',
                             password='Password!',
                             db='world',
                             charset='utf8mb4',
                             cursorclass=pymysql.cursors.DictCursor)
print ("connect successful!!")
print(conn)


def selectage():
    with conn:
        cursor = conn.cursor()  
        sql = ('select personname, age from person;')  
        cursor.execute(sql)
        results = cursor.fetchall()
        for row in results:
            print (row)

# shows all cities
def showcity():
    with conn:
        cursor = conn.cursor()  
        sql = ('Select * from city limit 15;')  
        cursor.execute(sql)
        data = cursor.fetchall()
        for row in data:
            #print (row)
            print (row["ID"], ":", row["Name"] ,":", row["CountryCode"],":", row["District"], ":",row["Population"])


# pulls in an operator (< > =) and population value
def findpopulation(operator, population):
    print("findpopulation", operator, population)
    with conn:
        cursor = conn.cursor()  
        sql = ('Select * from city where population %s %s'% (operator, population))  
        cursor.execute(sql)
        data = cursor.fetchall()
        for row in data:
            #print (row)
            print (row["ID"], ":", row["Name"] ,":", row["CountryCode"],":", row["District"], ":",row["Population"])



def addcity(city, countrycode, district, population):
    print("add city ", city, countrycode, district, population)
    with conn:
        try:
            cursor = conn.cursor()  
            sql = ('Insert into city (Name, CountryCode, District, Population) VALUES (%s, %s, %s, %s)'% (city, countrycode, district, population))  
            cursor.execute(sql)
            conn.commit()
            print("Insert Successful")
        #except pymysql.err.IntegrityError:
          #  print("Error", countrycode, "already exists")
        except:
            print("Maths already exists")
