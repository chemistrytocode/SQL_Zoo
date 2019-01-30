-- #1 Show name, continent and population of all countries
SELECT name, continent, population FROM world

-- #2 Show name of countries with a population of at least 200 million
SELECT name FROM world
 WHERE population > 200000000

-- #3 Show name & per capita GDP of countries with a population over 200 million
SELECT name, gdp/population FROM world
 WHERE population >= 200000000

-- #4 Show name & population in millions of the continent South America
SELECT name, population/1000000 FROM world
 WHERE continent = 'South America'

-- #5 Show the name and population for France, Germany and Italy
SELECT name, population FROM world
 WHERE name IN ('France', 'Germany', 'Italy')

-- #6 Show the countries whose names include United
SELECT name FROM world
 WHERE name LIKE 'United%'

-- #7 Show name & population of countres with an area over 3 million and
-- a population over 250 million
SELECT name, population, area FROM world
 WHERE area > 3000000 OR population > 250000000

-- #8 Show name, population & area of countries who have
-- An area greater than 3 million but population under 250 million
-- OR an area under 3 million but a population greater than 250 million
SELECT name, population, area  FROM world
 WHERE (area > 3000000 AND population < 250000000)
 OR (area < 3000000 AND population > 250000000)

-- #9 Show name, population in millions and gdp in billions for the
-- continent South America
SELECT name, ROUND(population/1000000, 2), ROUND(gdp/1000000000, 2) FROM world
WHERE continent = 'South America'

-- #10 Show name and per-capita gdp rounded to nearest 1000 of countries
-- whose gdp is greater than 1 trillion
SELECT name, ROUND(GDP/population, -3) FROM world
 WHERE gdp > 1000000000000

-- #11 Show name and capitals who have the same number of characters
SELECT name, capital FROM world
WHERE LENGTH(name) = LENGTH (CAPITAL)

-- #12 Show name and capitals who share the same first letter but
-- aren't the same word
SELECT name, capital FROM world
 WHERE LEFT(name,1) = LEFT(capital,1) AND (name <> capital)

-- #13 Find a country that contains all the vowels without spaces in its name
SELECT name FROM world
WHERE name LIKE '%A%'
AND name LIKE '%E%'
AND name LIKE '%I%'
AND name LIKE '%O%'
AND name like '%U%'
AND name NOT LIKE '% %'
