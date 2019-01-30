-- #1 Find countries that start with a Y
SELECT name FROM world
  WHERE name LIKE 'Y%'

-- #2 Find countries that end with a Y
SELECT name FROM world
  WHERE RIGHT(name,1) LIKE 'Y%'

-- #3 Find countries that contain an X
SELECT name FROM world
  WHERE name LIKE '%X%'

-- #4 Find countries that end with land
SELECT name FROM world
  WHERE RIGHT(name,4) LIKE '%land%'

-- #5 Find countries that start with C and end with IA
SELECT name FROM world
  WHERE LEFT(name, 1) LIKE 'C%' AND RIGHT(name, 2) LIKE 'ia%'

-- #6 Find countries that have a double o (oo)
SELECT name FROM world
  WHERE name LIKE '%oo%'

-- #7 Find countries that have three or more A's in the name
SELECT name FROM world
  WHERE name LIKE '%a%a%a%'

-- #8 Find countries that a t as a second character
SELECT name FROM world
 WHERE name LIKE '_t%'

-- #9 Find countries that have two o characters seperated by two other characters
SELECT name FROM world
 WHERE name LIKE '%o__o%'

 -- #10 Find countires that have exactly 4 characters
SELECT name FROM world
 WHERE LENGTH(name) = 4

-- #11 Find countries whose capital and name is the same
SELECT name FROM world
 WHERE name = capital

 -- #12 Find countries whose capital is the countries name + city
SELECT name FROM world
 WHERE CONCAT(name, ' City') = capital

 -- #13 Find countries whose capital includes the name of the country
SELECT capital,name FROM world
 WHERE capital LIKE concat('%', name, '%');

 -- #14 Find countries whose capital is an extension of the name
 -- E.g. Mexcico City, NOT Luxembourg
SELECT capital,name FROM world
 WHERE capital LIKE concat('%', name, '_%');

 -- #15 Show the name and extension where a capital is an extension of a name of a country
SELECT name, REPLACE(capital, name, '') FROM world
 WHERE capital LIKE concat('%', name, '%') AND capital > name
