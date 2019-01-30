-- #1 Countries with a population larger than Russia
SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia')

-- #2 Show countries in Europe with GDP greater than the UK
SELECT name FROM world
 WHERE continent = 'Europe' AND gdp/population >
  (SELECT gdp/population FROM world
   WHERE name = 'United Kingdom')

-- #3 Show names and continents of countries in the same continent as
-- Argentina or Austrailia, then Order by name.
SELECT name, continent FROM world
 WHERE continent =
  (SELECT continent FROM world
   WHERE name = 'Argentina')
  OR continent =
  (SELECT continent FROM world
   WHERE name = 'Australia') ORDER by name ASC

-- #4 Show name and population of countries greater than Canada but
-- less than Poland
SELECT name, population FROM world
  WHERE population >
   (SELECT population FROM world
    WHERE name = 'Canada')
  AND population <
   (SELECT population FROM world
    WHERE name = 'Poland')

-- #5 Show name and population of each country in Europe. Show population
-- as a percentage of Germany's population
SELECT name,
 CONCAT(ROUND(100* population/
  (SELECT population FROM world
    WHERE name = 'Germany')), '%')
 FROM world
 WHERE continent = 'Europe'

-- #6 Show countries with a GDP greater than every country in Europe
SELECT name FROM world
 WHERE gdp > (SELECT MAX(gdp) FROM world
 WHERE continent = 'Europe')

-- #7 Show name and area of largest country in each continent
SELECT continent, name, area FROM world x
  WHERE area >= ALL
    (SELECT area FROM world y
      WHERE y.continent=x.continent
        AND area>0)

-- #8 Show continent and name of first country that comes alphabetically
SELECT continent, name FROM world x
  WHERE name = (SELECT name FROM world y
    WHERE y.continent=x.continent
      ORDER BY name ASC
        LIMIT 1)

-- #9 Show name, continent and population of all countries with a population
-- under 250 million
SELECT name, continent, population FROM world x
  WHERE NOT EXISTS
    (SELECT * FROM world y
      WHERE x.continent = y.continent
       AND population > 25000000)

-- #10 Show name and continent of countries who have more than 3 times the
-- population of any other country in their continent.
SELECT x.name, x.continent FROM world AS x
 WHERE x.population/3 > ALL
  (SELECT y.population FROM world AS y
  WHERE x.continent = y.continent
  AND x.name <> y.name)
