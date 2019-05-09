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


SELECT p.personID, p.personname, c.Name, v.dateArrived, country.Name 
FROM person as p
Inner join hasvisitedcity as v 
on p.personID = v.personID
Inner join city as c 
on v.cityID = c.ID
Inner join country 
on  c.CountryCode = country.code
where country.Name LIKE '%braz%';

SELECT *
from country 
where country.Name LIKE '%ir%';

select *
from country 
where population > 10000000;


select *
from city
where CountryCode LIKE "%IRL";



INSERT INTO city (Name, CountryCode, District, Population )
   VALUES ( "tEST", "IRE", "Connaught", "800000" );
   
   
   
   
   