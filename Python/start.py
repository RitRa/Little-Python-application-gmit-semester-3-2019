# connect to world database
from connect import *
# connect to mongo database
from connect_mongod import *

import sys


# get the users choice
def get_input():
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
    # get the user to input values
    city = input("Enter city name : ")
    countrycode = input("Country Code :")
    district = input("District : ")
    population = input("Population : ")
    addcity(city, countrycode, district, population) 

# choice 4:find engine size
def find_engineSize(): 
    engine = input("Enter engine Size : ")
    call_query(engine)

#choice 5: add a car
def add_car():
    car_id = input("Enter _id : ")
    reg = input("Enter Reg : ")
    engine = input("Enter Engine Size : ")
    addCar(car_id, reg, engine)

# choice 6: view countries
def view_country():
    country = input("Enter Country Name : ")
    find_Country(country)

# choice 7: view country by population
def countryPop():
    operator = input("Enter < > or = : ")
    population = input("Enter population : ")
    country_Population(operator,population)




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
    user_input = get_input()
    choice(user_input)
    

# user defined choice
def choice(user_input):
    # if the user input is a number begin checking which one
    if(user_input.isdigit()):
        number = int(user_input)
        if (number == 1):
            showcity()
        elif (number == 2):
            get_pop()  
        elif (number == 3):
            add_city()  
        elif (number == 4):
            find_engineSize() 
        elif (number == 5):
            add_car() 
        elif (number == 6):
            view_country()
        elif (number == 7): 
            countryPop() 

    # otherwise it is a string        
    else:
        # if the user selected X terminiate the program
        if(user_input =="x"):
            quit()
        # if they select another string show the menu again
        else:
            main() 
  

if __name__ == "__main__":
	# execute only if run as a script 
	main()



    


