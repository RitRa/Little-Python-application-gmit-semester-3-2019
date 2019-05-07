# connect to world database
from connect import *
# connect to mongo database
from connect_mongod import *


# get the users number
def get_number():
    return input("Choice : ")

# choice 2 get the population
def get_pop():
    # get the operator
    operator = input("Enter < > or = : ")
    # get the population
    population = input("Enter population : ")
    findpopulation(operator, population)

# choice 3 add new city1
def add_city():
    city = input("Enter city name : ")
    countrycode = input("Country Code :")
    district = input("District : ")
    population = input("Population : ")
    addcity(city, countrycode, district, population) 

# choice 4 :find engine size
def find_engineSize(): 
    engine = input("Enter engine Size : ")
    #find(engine)
    call_query(engine)

#choice 5: add a car
def add_car():
    car_id = input("Enter _id : ")
    reg = input("Enter Reg : ")
    engine = input("Enter Engine Size : ")
    addCar(car_id, reg, engine)

def view_country():
    country = input("Enter Country Name : ")


# menu
def main():
    # try connection to mongo database

    #print the menu    
    print("World DB")
    print("-"*8 + "\n")
    print("")
    print("MENU")
    print("=" * 4)
    print("1 - View 15 Cities")
    print("2 - View Cities by population")
    print("3 - Add New City")
    print("4 - Find car by Engine Size")
    print("5 - Add new car")
    print("6 - View Countries by name")
    print("7 - View Countries by population")
    print("x - Exit Application")
    number = get_number()
    choice(number)
    

# user defined choice
def choice(number):
    # turn into a number
    number = int(number)
    if (number == 1):
        # choice 1 show the first 15 cities
        #print ("Choice: ", number)
        showcity()
    elif (number == 2):
        #print ("Choice: ", number)
        get_pop()  
    elif (number == 3):
        print ("Choice: ", number)
        add_city()  
    elif (number == 4):
        print ("Choice: ", number)
        find_engineSize() 
    elif (number == 5):
        print ("Choice: ", number)
        add_car() 
    elif (number == 6):
        print ("Choice: ", number)  
        view_country()
    elif (number == 7):
        print ("Choice: ", number)        

if __name__ == "__main__":
	# execute only if run as a script 
	main()



    


