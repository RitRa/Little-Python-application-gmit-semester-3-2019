show databases;
 
use world;

show tables;

Select MIN(age) from person;
Select * from person;
# two people with the lowest ages jane and sean
SELECT personname from person WHERE age in (Select MIN(age) from person);


SELECT p.personname,p.age, c.Name AS City, country.Population
FROM (SELECT personname, age, personID 
				from person WHERE age in (Select MIN(age) from person)) as p
Inner join hasvisitedcity v on p.personID = v.personID
Inner join city as c on v.cityID = c.ID
Inner join (select code, population from country) country
where population in (select min(population) from country)) as country 
on c.CountryCode = country.code
group by p.personID;

select * from country;
select * from city;
select * from hasvisitedcity;
select * from person;

select c.Name AS City, v.Population, personname
from city c
Inner join hasvisitedcity v on c.ID = v.cityID
Inner join person p on v.personID = p.personID
where v.Population in (select max(population) from country) 
and personname in (SELECT personname, age, personID 
				from person WHERE age in (Select MIN(age) from person));


select c.Name AS City, country.Population, personname
from city c
join country on c.CountryCode = country.code
Inner join hasvisitedcity v on c.ID = v.cityID
Inner join person p on v.personID = p.personID
where country.Population = (select min(population) from country 
						where Code = (select * from hasvisitedcity
                        where cityID = (select * from city 
                        where cityID = ) );
                        
                        
select p.personname, c.name, c.population from city c
join hasvisitedcity v on city.id = v.cityID
join person p on v.personID = (select * from person where age = (select min(age) from person))
group by p.personname;                       
                        
## min age
SELECT personID, personname, age from person
where age = (select min(age) from person)
group by personID, personname;
                        
select *                        
from                        
(SELECT personID, personname, age from person
where age = (select min(age) from person)
group by personID, personname) sub;

#sean					
select c.ID, p.personid from 
	city c 
	join hasvisitedcity v on c.ID = v.cityID   
    join person p on v.personID = p.personID
    where p.age = (select min(age) from person);

Select * 
from city c 
join hasvisitedcity v on c.ID = v.cityID   
join person p on v.personID = p.personID
WHERE p.personid IN(                      
	select p.personid 
	from city c 
	join hasvisitedcity v on c.ID = v.cityID   
    join person p on v.personID = p.personID
    where p.age = (select min(age) from person));
    
Select * 
from city c 
join hasvisitedcity v on c.ID = v.cityID   
join person p on v.personID = p.personID
where c.id in (SELECT c.id, c.name, c.population FROM city 
where c.ID = v.cityID in (Select * from hasvisitedcity
		WHERE v.personID = p.personid IN(                      
			select p.personid 
			from city c 
			join hasvisitedcity v on c.ID = v.cityID   
			join person p on v.personID = p.personID
			where p.age = (select min(age) from person))));    
            
# Dordrecht , sean           
select min(Population), p.personname, p.age
from city c
join hasvisitedcity v on c.ID = v.cityID  
join person p on v.personID = p.personID
WHERE p.personid IN(                      
	select p.personid 
	from city c 
	join hasvisitedcity v on c.ID = v.cityID   
    join person p on v.personID = p.personID
    where p.age = (select min(age) from person))
group by p.personname, p.age ;

select * from person;
select population, p.personname, p.age                       
from city c
join hasvisitedcity v on c.ID = v.cityID   
join person p on v.personID = p.personID
where Population in( select min(Population)
from city c
join hasvisitedcity v on c.ID = v.cityID  
join person p on v.personID = p.personID
WHERE p.personid IN(                      
	select p.personid 
	from city c 
	join hasvisitedcity v on c.ID = v.cityID   
    join person p on v.personID = p.personID
    where p.age = (select min(age) from person)));
    
select min(Population), p.personID, p.personname
from city c
join hasvisitedcity v on c.ID = v.cityID  
join person p on v.personID = p.personID
WHERE p.personid IN(                      
	select p.personid 
	from city c 
	join hasvisitedcity v on c.ID = v.cityID   
    join person p on v.personID = p.personID
    where p.age = (select min(age) from person))
    GROUP BY p.personID;

select *                       
from city c
join hasvisitedcity v on c.ID = v.cityID   
join person p on v.personID = p.personID
where Population in (select min(Population)
from city c
join hasvisitedcity v on c.ID = v.cityID  
join  (select p.personid, p.personname, min(p.age) from person) p
on v.personID = p.personID);


select *
from person p
where p.personID = (select min(Population)
from city c
join hasvisitedcity v on c.ID = v.cityID  
join person p on v.personID = p.personID
WHERE p.personID IN(                      
	select p.personID
	from city c 
	join hasvisitedcity v on c.ID = v.cityID   
    join person p on v.personID = p.personID
    where p.age = (select min(age) from person)));
    
    
select *
	from city c 
	join hasvisitedcity v on c.ID = v.cityID   
    join person p on v.personID = p.personID
    where p.age = (select min(age) from person)) p on v.personID = p.personID
where c.Population in (select min(Population)
from city c);    