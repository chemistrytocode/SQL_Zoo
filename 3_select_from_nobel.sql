-- #1 Show nobel prizes for 1950
SELECT * FROM nobel
 WHERE yr = 1950

-- #2 Show who won the 1962 prize for literature
SELECT winner FROM nobel
 WHERE yr = 1962 AND subject = 'Literature'

 -- #3 Show year and subject that won Albert Einstein his prize
SELECT yr, subject FROM nobel
 WHERE winner = 'Albert Einstein'

 -- #4 Show name of Peace winners since 2000
SELECT winner FROM nobel
 WHERE subject = 'Peace' AND yr >= 2000

-- #5 Show everything for Literature prize winners from 1980 to 1989
SELECT * FROM nobel
 WHERE subject = 'Literature' AND (yr >= 1980 AND yr <= 1989)

-- #6 Show everything for presidential winners
SELECT * FROM nobel
 WHERE winner IN ('Theodore Roosevelt', 'Woodrow Wilson', 'Jimmy Carter', 'Barack Obama')

-- #7 Show winners whose first name is John
SELECT winner FROM nobel
 WHERE LEFT(winner, 4) = 'John'

-- #8 Show winners of 1980 Physics and 1984 Chemistry
SELECT * FROM nobel
 WHERE (subject = 'Physics' AND yr = 1980) OR (subject = 'Chemistry' AND yr = '1984')

-- #9 Show everything for 1980 excluding Chemistry and Medicine
SELECT * FROM nobel
 WHERE yr = 1980 AND (subject <> 'Chemistry' AND subject <> 'Medicine')

-- #10 Show everything for pre 1910 Medicine and post 2004 Literature (inclusive)
SELECT * FROM nobel
 WHERE (subject = 'Medicine' AND yr < 1910) OR (subject = 'Literature' AND yr >= 2004)

-- #11 Show everything won by 'PETER GRÜNBERG'
SELECT * FROM nobel
WHERE winner = 'PETER GRÜNBERG'

-- #12 Show everything won by EUGENE O'NEILL
SELECT * FROM nobel
 WHERE winner = 'EUGENE O''NEILL'

-- #13 Show winner, year & subject of winners starting with Sir, then order
-- by the year that was won (most recent first)
SELECT winner, yr, subject FROM nobel
 WHERE LEFT(winner, 3) = 'Sir' ORDER BY yr DESC

-- #14 Show winner & subject for 1984 and order by subject, list Chemistry
-- and Physics last
SELECT winner, subject FROM nobel
 WHERE yr=1984
  ORDER BY
  CASE WHEN subject IN ('Physics', 'Chemistry') THEN 1 ELSE 0 END,
   subject, winner
