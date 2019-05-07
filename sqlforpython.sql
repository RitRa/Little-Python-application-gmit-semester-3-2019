show databases;
 
use world;

show tables;

#call get_ppl_visited_country(n);

SELECT personID, personname, age
FROM person;

SELECT * FROM city;

SELECT * FROM country;

SELECT * FROM countrylanguage;

select * from hasvisitedcity;

# 1. The user is shown the first 15 cities in the world database:

Select ID, Name, CountryCode, District, Population from city
limit 15;