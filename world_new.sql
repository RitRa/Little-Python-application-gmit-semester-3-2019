show databases;
 
use world;

show tables;

SELECT personID, personname, age
FROM person;

SELECT * FROM city;

SELECT * FROM country;

SELECT * FROM countrylanguage;

select * from hasvisitedcity;


###############################
## 4.1.1 Get people who have visited a particular country

delimiter //
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_ppl_visited_country`(IN CountryName varchar(52))
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
	where country.Name LIKE CONCAT('%',CountryName,'%') ;
END
//
delimiter ;

call get_ppl_visited_country("zil");


###############################
#4.1.2 Rename Continent 
delimiter //
CREATE FUNCTION `ren_continent`(Continent varchar(52)) 
RETURNS varchar(20) 
DETERMINISTIC
BEGIN
CASE
	WHEN (Continent = 'North America') then SET 'Americas';
	WHEN (Continent = 'South America') then  SET 'Americas';
	WHEN (Continent = 'Oceania') then SET 'Australia';
    WHEN (Continent = 'Antartica') then SET 'South Pole';
    ELSE NULL
END CASE;
RETURN 'New Name';
END
//
delimiter ;

SELECT Continent as 'Original Name', ren_continent(Continent) as 'New Name'
FROM country;

###############################
# 4.1.3 Country with biggest population per continent

SELECT Continent, name, population
FROM country
WHERE population IN (SELECT Max(population)
				FROM country
				GROUP BY Continent) 
AND population > 0
Order by population desc;

###############################
# 4.1.4 Minimum city population of youngest person(s)
# Dordrecht , sean           
select p.personname, p.age, min(c.Population) as pop
from city c
join hasvisitedcity v on c.ID = v.cityID  
join person p on v.personID = p.personID
WHERE p.personid IN(                      
	select p.personid 
	from city c 
	join hasvisitedcity v on c.ID = v.cityID   
    join person p on v.personID = p.personID
    where p.age = (select min(age) from person))
group by p.personid;


###############################
# 4.1.5 update city populations 

# '715', 'Port Elizabeth', 'ZAF', 'Eastern Cape', '752319', NULL, NULL
#'712', 'Cape Town', 'ZAF', 'Western Cape', '2352121', NULL, NULL
# '750', 'Paarl', 'ZAF', 'Western Cape', '105768', NULL, NULL
# '727', 'Bloemfontein', 'ZAF', 'Free State', '334341', NULL, NULL
#'712', 'Cape Town', 'ZAF', 'Western Cape', '2100', NULL, NULL

update city set Population=
CASE when (District='Eastern Cape') then Population+1000
	 when (District='Free State') then Population+2000 
     when (District='Western Cape') then Population-10000
     else Population +0
END
where District in('Eastern Cape','Free State','Western Cape');


###############################
# 4.1.6 Country Independence

select name, IndepYear,
CASE
	WHEN (IndepYear IS NULL) then 'n/a'
	WHEN ((year(curdate())) - IndepYear) < 10 then 'New' 
    WHEN ((year(curdate())) - IndepYear) between 10 and 49 then CONCAT('Modern', ' ', GovernmentForm )
    WHEN ((year(curdate())) - IndepYear) between 50 and 100 then CONCAT('Early', ' ', GovernmentForm )
    WHEN ((year(curdate())) - IndepYear) > 100 then CONCAT('Old', ' ', GovernmentForm )
    WHEN (Population > 100000000) then CONCAT('Large', ' ', GovernmentForm )
END AS 'Desc'
FROM country;