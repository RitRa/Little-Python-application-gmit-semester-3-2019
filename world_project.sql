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


###############################
## 4.1.1 Get people who have visited a particular country
delimiter //
CREATE PROCEDURE `get_ppl_visited_country`(IN CountryName varchar(52))
    DETERMINISTIC
BEGIN
	SELECT p.personID, p.personname, c.Name, v.dateArrived, country.Name
	FROM person as p
	Inner join hasvisitedcity as v 
	on p.personID = v.personID
	Inner join city as c 
	on v.cityID = c.ID
	Inner join country 
	on  c.CountryCode = country.code
	where country.Name LIKE CountryName;
END
//
delimiter ;

call get_ppl_visited_country("Brazil");



###############################
#4.1.2 Rename Continent

DELIMITER //

CREATE FUNCTION ren_continent(Continent varchar(52)) RETURNS varchar(20)
    DETERMINISTIC
BEGIN
   DECLARE New_Name varchar(20);
    IF (Continent = 'North America' AND Continent = 'South America') THEN
        SET New_Name = 'Americas';
    ELSEIF Continent = 'Oceania'  THEN
        SET New_Name = 'Australia';
    ELSEIF Continent = 'Antartica' THEN
        SET New_Name = 'South Pole';
    END IF;
   RETURN New_Name;

END; //

DELIMITER ;

SELECT Continent, ren_continent(Continent) as 'New Name'
FROM country;


###############################
# 4.1.3 Country with biggest population per continent

Select Continent, FORMAT(sum(population), 0) as pop
FROM country
WHERE population > 0
GROUP BY Continent
order by sum(population) desc;

###############################
# 4.1.4 Minimum city population of youngest person(s)

select * from hasvisitedcity;
select * from country;
select * from city;

SELECT personID, personname, age
FROM person;

SELECT p.personID, p.personname, p.age, c.Name, country.Population
FROM person p
Inner join hasvisitedcity v
on p.personID = v.personID
Inner join city as c
on v.cityID = c.ID
Inner join country 
on  c.CountryCode = country.code;

SELECT p.personID, p.personname, p.age, c.Name, country.Population
FROM person p
Inner join hasvisitedcity v
on p.personID = v.personID
Inner join city as c
on v.cityID = c.ID
Inner join country 
on  c.CountryCode = country.code;

SELECT personID, personname, age
FROM person;

SELECT MIN(age)
FROM person;

SELECT p.personID, p.personname, p.age, c.Name, format(country.Population, 0)
FROM person p
Inner join hasvisitedcity v
on p.personID = v.personID
Inner join city as c
on v.cityID = c.ID
Inner join country 
on  c.CountryCode = country.code
WHERE (	p.age = (select MIN(age) from person));


SELECT p.personID, p.personname, p.age, c.Name AS City, format(country.Population, 0) as population
FROM person p
Inner join hasvisitedcity v
on p.personID = v.personID
Inner join city as c
on v.cityID = c.ID
Inner join country 
on  c.CountryCode = country.code
WHERE age IN (select MIN(age) from person) AND 
country.Population = (select LEAST(Population) from country);


####### min not working
SELECT p.personname AS Name, (select MIN(age) from person) AS Age, c.Name AS City, country.Population
FROM person p
Inner join hasvisitedcity v
on p.personID = v.personID
Inner join city as c
on v.cityID = c.ID
Inner join country 
on  c.CountryCode = country.code
where country.Population IN (select Min(Population) from country);

####### min not working
SELECT p.personname AS Name, p.age, c.Name AS City, country.Population
FROM person p
Inner join hasvisitedcity v
on p.personID = v.personID
Inner join city as c
on v.cityID = c.ID
Inner join country 
on  c.CountryCode = country.code
where p.age in 
(select MIN(p.age) from person 
where country.Population = 
(select Min(country.Population) 
from country 
group by personname ));

SELECT p.personname AS Name, p.age, c.Name AS City, country.Population
FROM person p
Inner join hasvisitedcity v
on p.personID = v.personID
Inner join city as c
on v.cityID = c.ID
Inner join country 
on  c.CountryCode = country.code