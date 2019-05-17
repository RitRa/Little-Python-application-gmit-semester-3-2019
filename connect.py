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


        


# choice 1: shows all cities
def showcity():
    with conn:
        cursor = conn.cursor()  
        sql = ('Select * from city limit 15;')  
        cursor.execute(sql)
        data = cursor.fetchall()
        for row in data:
            #print (row)
            print (row["ID"], ":", row["Name"] ,":", row["CountryCode"],":", row["District"], ":",row["Population"])
        

# choice 2
# pulls in an operator (< > =) and population value
def findpopulation(operator, population):
    #print("findpopulation", operator, population)
    with conn:
        cursor = conn.cursor()  
        sql = ('Select * from city where population %s %s'% (operator, population))  
        cursor.execute(sql)
        data = cursor.fetchall()
        for row in data:
            #print (row)
            print (row["ID"], ":", row["Name"] ,":", row["CountryCode"],":", row["District"], ":",row["Population"])

# choice 3
def addcity(city, countrycode, district, population):
    print("add city ", city, countrycode, district, population)
    with conn:
        try:
            cursor = conn.cursor()  
            sql = ("Insert into city (Name, CountryCode, District, Population) VALUES (%s, %s, %s, %s)")  
            cursor.execute(sql, (city, countrycode, district, population))
            cursor.close()
            print("Insert Successful")
        except Exception as e:
            #print(e)
            print("****Error***:CountryCode",countrycode, "does not exist" )
        #finally:
            


def find_Country(country):
    #print("country: ", country)
    with conn:
        cursor = conn.cursor()  
        sql = ("""SELECT *
                from country 
                where Name LIKE '%%%s%%' """ % (country,) )
        cursor.execute(sql)
        data = cursor.fetchall()
        for row in data:
             print (row["Name"], ":", row["Continent"] ,":", row["Population"],":", row["HeadOfState"])


def country_Population(operator,population):
    print("user input", operator, population)
    with conn:
        cursor = conn.cursor()  
        sql = ('Select * from country where population %s %s'% (operator, population)) 
        cursor.execute(sql)
        data = cursor.fetchall()
        for row in data:
            print (row["Code"], ":", row["Name"] ,":", row["Continent"],":", row["Population"])

