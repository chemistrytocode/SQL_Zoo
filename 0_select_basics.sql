-- #1 Show the population of Germany
SELECT population FROM world
WHERE name = 'Germany';

-- #2 Show name and population for Sweden, Norway and Denmark
SELECT name, population FROM world
WHERE name IN ('Sweden', 'Norway', 'Denmark');

  --#3 Show countries with areas between 200,000 and 250,000
SELECT name, area FROM world
WHERE area BETWEEN 200000 AND 250000
