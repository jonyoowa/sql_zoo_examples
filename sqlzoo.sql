### 0 SELECT basics
# 1. 
SELECT population FROM world
  WHERE name = 'Germany'

# 2. 
SELECT name, population FROM world
  WHERE name IN ('Sweden', 'Norway', 'Denmark')

# 3. 
SELECT name, area FROM world
  WHERE area BETWEEN 200000 AND 250000

###

### 1 SELECT name
# 1.
SELECT name FROM world
  WHERE name LIKE 'Y%'

# 2. 
SELECT name FROM world
  WHERE name LIKE '%y'

# 3. 
SELECT name FROM world
  WHERE name LIKE '%x%'

# 4. 
SELECT name FROM world
  WHERE name LIKE '%land'

# 5.
SELECT name FROM world
  WHERE name LIKE 'C%ia'

# 6. 
SELECT name FROM world
  WHERE name LIKE '%oo%'

# 7. 
SELECT name FROM world
  WHERE name LIKE '%a%a%a%'

# 8. 
SELECT name FROM world
 WHERE name LIKE '_t%'
ORDER BY name

# 9.
SELECT name FROM world
 WHERE name LIKE '%o__o%'

# 10.
SELECT name FROM world
 WHERE name LIKE '____'

# 11.
SELECT name
  FROM world
  WHERE name LIKE capital

# 12.
SELECT name
  FROM world
  WHERE capital LIKE CONCAT(name, ' City')

# 13. 
SELECT capital, name
  FROM world
  WHERE capital LIKE CONCAT(name, '%')

# 14. 
SELECT capital, name
  FROM world
  WHERE capital LIKE CONCAT(name, '_%')

# 15. 
SELECT name, REPLACE(capital, name, '') 
  FROM world
  WHERE capital LIKE concat(name, '%')
  AND name NOT LIKE capital

### 

### 2 SELECT from World

# 1. 
SELECT name, continent, population 
  FROM world

# 2. 
SELECT name 
  FROM world
  WHERE population >= 200000000

# 3. 
SELECT name, gdp/population
  FROM world
  WHERE population >= 200000000

# 4. 
SELECT name, population/1000000
  FROM world
  WHERE continent LIKE 'South America'

# 5. 
SELECT name, population
  FROM world
  WHERE name IN ('France', 'Germany', 'Italy')

# 6. 
SELECT name
  FROM world
  WHERE name LIKE '%United%'

# 7. 
SELECT name, population, area
  FROM world
  WHERE population >= 250000000
  OR area >= 3000000

# 8. 
SELECT name, population, area
  FROM world
  WHERE population >= 250000000
  XOR area >= 3000000

# 9. 
SELECT name, ROUND(population/1000000, 2), ROUND(GDP/1000000000, 2)
  FROM world
  WHERE continent LIKE 'South America'

# 10.
SELECT name, ROUND(GDP/population, -3)
  FROM world
  WHERE GDP >= 1000000000000

# 11.
SELECT name, capital
  FROM world
  WHERE LENGTH(name) = LENGTH(capital)

# 12.
SELECT name, capital
  FROM world
  WHERE LEFT(name,1) LIKE LEFT(capital,1)
  AND name <> capital

# 13. 
SELECT name 
  FROM world 
  WHERE name LIKE '%a%' AND name LIKE '%e%' AND name LIKE '%i%' AND name LIKE '%o%' AND name LIKE '%u%' AND name NOT LIKE '% %'

###

### 3 SELECT from Nobel

# 1. 
SELECT yr, subject, winner
  FROM nobel
  WHERE yr = 1950

# 2. 
SELECT winner
  FROM nobel
  WHERE yr = 1962
  AND subject = 'Literature'

# 3. 
SELECT yr, subject
  FROM nobel
  WHERE winner = 'Albert Einstein'

# 4. 
SELECT winner
  FROM nobel
  WHERE subject LIKE 'Peace'
  AND yr >= 2000

# 5. 
SELECT yr, subject, winner
  FROM nobel
  WHERE subject LIKE 'Literature'
  AND yr BETWEEN 1980 AND 1989

# 6. 
SELECT *
  FROM nobel
  WHERE winner IN('Theodore Roosevelt', 'Woodrow Wilson', 'Jimmy Carter', 'Barack Obama')

# 7. 
SELECT winner
  FROM nobel 
  WHERE winner LIKE 'John%'

# 8. 
SELECT yr, subject, winner
  FROM nobel 
  WHERE subject LIKE 'Physics' AND yr = 1980
  OR subject LIKE 'Chemistry' AND yr = 1984

# 9. 
SELECT yr, subject, winner
  FROM nobel 
  WHERE yr = 1980
  AND subject NOT IN ('Chemistry', 'Medicine')

# 10.
SELECT yr, subject, winner
  FROM nobel 
  WHERE yr < 1910 AND subject LIKE 'Medicine'
  OR yr >= 2004 AND subject LIKE 'Literature'

# 11.
SELECT * 
  FROM nobel
  WHERE winner LIKE 'PETER GRÜNBERG'

# 12.
SELECT * 
  FROM nobel
  WHERE winner LIKE 'EUGENE O\'NEILL'

# 13. 
SELECT winner, yr, subject
  FROM nobel
  WHERE winner LIKE 'Sir%'
  ORDER BY yr DESC, winner

# 14.
SELECT winner, subject
  FROM nobel
  WHERE yr=1984
  ORDER BY subject IN ('Chemistry', 'Physics'), subject, winner

### 

### 4 SELECT within SELECT

# 1. 
SELECT name 
  FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia')

# 2. 
SELECT name 
  FROM world
  WHERE GDP/population > (SELECT GDP/population FROM world WHERE name LIKE 'United Kingdom')
  AND continent LIKE 'Europe'

# 3. 
SELECT name, continent
  FROM world
  WHERE continent IN (SELECT continent FROM world WHERE name LIKE 'Argentina' OR name LIKE 'Australia')
  ORDER BY name

# 4. 
SELECT name, population
  FROM world 
  WHERE population > (SELECT population FROM world WHERE name LIKE 'Canada')
  AND population < (SELECT population FROM world WHERE name LIKE 'Poland')

# 5. 
SELECT name, CONCAT(ROUND(100*population/(SELECT population FROM world WHERE name LIKE 'Germany')), '%')
  FROM world
  WHERE continent LIKE 'Europe'

# 6. 
SELECT name
  FROM world
  WHERE gdp > (SELECT MAX(gdp) FROM world WHERE continent LIKE 'Europe')

# 7. 
SELECT continent, name, area
  FROM world
  WHERE area IN (SELECT MAX(area) FROM world GROUP BY continent)

# 8. 
SELECT continent, MIN(name)
  FROM world
  GROUP BY continent

# 9. 
SELECT name, continent, population 
  FROM world
  WHERE continent NOT IN (SELECT DISTINCT continent FROM world WHERE population > 25000000)

# 10.
SELECT name, continent 
  FROM world current 
  WHERE population > ALL(SELECT population * 3 FROM world WHERE continent = current.continent AND name <> current.name)

###

### 5 SUM and COUNT

# 1. 
SELECT SUM(population)
  FROM world

# 2. 
SELECT DISTINCT continent
  FROM world

# 3. 
SELECT SUM(gdp)
  FROM world
  WHERE continent LIKE 'Africa'

# 4. 
SELECT count(*)
  FROM world
  WHERE area >= 1000000

# 5. 
SELECT sum(population)
  FROM world
  WHERE name IN ('Estonia', 'Latvia', 'Lithuania')

# 6. 
SELECT continent, COUNT(name)
  FROM world
  GROUP BY continent

# 7. 
SELECT continent, COUNT(name)
  FROM world
  WHERE population > 10000000
  GROUP BY continent

# 8. 
SELECT continent
  FROM world
  GROUP BY continent
  HAVING SUM(population) > 100000000

### 

### 6 JOIN

# 1.
SELECT matchid, player 
  FROM goal 
  WHERE teamid = 'GER'

# 2. 
SELECT id, stadium, team1, team2
  FROM game
  WHERE id = '1012'

# 3. 
SELECT player, teamid, stadium, mdate
  FROM game 
  JOIN goal ON (game.id=goal.matchid)
  WHERE goal.teamid = 'GER'
  
# 4. 
SELECT team1, team2, player
  FROM game 
  JOIN goal ON (game.id=goal.matchid)
  WHERE goal.player LIKE 'Mario%'
  
# 5. 
SELECT player, teamid, coach, gtime
  FROM goal 
  JOIN eteam ON (goal.teamid=eteam.id)
  WHERE gtime <= 10

# 6. 
SELECT mdate, teamname
  FROM game
  JOIN eteam ON (team1=eteam.id)
  WHERE coach LIKE 'Fernando Santos'

# 7. 
SELECT player
  FROM game
  JOIN goal ON (game.id=goal.matchid)
  WHERE stadium LIKE 'National Stadium, Warsaw'

# 8. 
SELECT DISTINCT player
  FROM game 
  JOIN goal ON matchid = id 
  WHERE (team1='GER' OR team2='GER') AND teamid<>'GER'

# 9. 
SELECT teamname, COUNT(*) AS goals
  FROM eteam 
  JOIN goal ON id=teamid
  GROUP BY teamname

# 10.
SELECT stadium, COUNT(*) as goals
  FROM game 
  JOIN goal ON game.id=goal.matchid
  GROUP BY stadium

# 11.
SELECT matchid, mdate, COUNT(teamid)
  FROM game 
  JOIN goal ON matchid = id 
  WHERE (team1 = 'POL' OR team2 = 'POL')
  GROUP BY matchid, mdate

# 12.
SELECT matchid, mdate, COUNT(matchid)
  FROM game 
  JOIN goal ON id=matchid
  WHERE teamid = 'GER'
  GROUP BY matchid, mdate

# 13. 
SELECT mdate, team1, SUM(CASE WHEN teamid=team1 THEN 1 ELSE 0 END) score1, team2, SUM(CASE WHEN teamid=team2 THEN 1 ELSE 0 END) score2
  FROM game 
  LEFT JOIN goal ON matchid = id
  GROUP BY mdate, matchid, team1, team2

### 

### 7 More JOIN operation

# 1. 
SELECT id, title
 FROM movie
 WHERE yr=1962

# 2. 
SELECT yr
 FROM movie
 WHERE title LIKE 'Citizen Kane'

# 3. 
SELECT id, title, yr
 FROM movie
 WHERE title LIKE '%Star Trek%'

# 4. 
SELECT id
  FROM actor
  WHERE name LIKE 'Glenn Close'

# 5. 
select id 
  FROM movie
  WHERE title LIKE 'Casablanca'

# 6. 
SELECT name
  FROM casting
  JOIN actor ON casting.actorid=actor.id
  WHERE movieid=11768

# 7. 
SELECT name
  FROM casting
  JOIN actor ON casting.actorid=actor.id
  WHERE movieid=(SELECT id FROM movie WHERE title='Alien')

# 8. 
SELECT movie.title
  FROM movie
  JOIN casting ON movie.id=casting.movieid
  JOIN actor ON casting.actorid=actor.id
  WHERE actor.id = (SELECT id FROM actor WHERE name LIKE 'Harrison Ford')

# 9. 
SELECT title 
  FROM movie
  JOIN casting ON movie.id=casting.movieid
  JOIN actor ON casting.actorid=actor.id
  WHERE actor.id = (SELECT id FROM actor WHERE name LIKE 'Harrison Ford' AND casting.ord<>1)

# 10.
SELECT title, name
  FROM movie
  JOIN casting ON movie.id=casting.movieid
  JOIN actor ON casting.actorid=actor.id
  WHERE movie.yr = 1962
  AND casting.ord = 1

# 11.
SELECT yr,COUNT(title) FROM
  movie JOIN casting ON movie.id=movieid
         JOIN actor   ON actorid=actor.id
where name='John Travolta'
GROUP BY yr
HAVING COUNT(title)=(SELECT MAX(c) FROM
(SELECT yr,COUNT(title) AS c FROM
   movie JOIN casting ON movie.id=movieid
         JOIN actor   ON actorid=actor.id
 where name='John Travolta'
 GROUP BY yr) AS t
)

# 12.
SELECT title, name
  FROM movie
  JOIN casting ON (movie.id=casting.movieid AND casting.ord=1)
  JOIN actor ON casting.actorid=actor.id  
  WHERE movie.id IN (SELECT movieid FROM casting WHERE actorid IN (SELECT id FROM actor WHERE name LIKE 'Julie Andrews'))

# 13. 
SELECT name
  FROM actor JOIN casting ON casting.actorid=actor.id
  WHERE casting.ord = 1
  GROUP BY name
  HAVING COUNT(movieid) >= 30;

# 14.
SELECT title, COUNT(actorid)
  FROM movie JOIN casting ON casting.movieid=movie.id
  WHERE yr = 1978
  GROUP BY title
  ORDER BY COUNT(actorid) DESC, title

# 15. 
SELECT name
  FROM actor 
  JOIN casting ON casting.actorid=actor.id
  WHERE movieid IN(SELECT movieid FROM casting WHERE actorid = (SELECT id FROM actor WHERE name = 'Art Garfunkel'))
  AND name <> 'Art Garfunkel';

### 

### 8 Using NULL

# 1. 
SELECT name
  FROM teacher
  WHERE dept IS NULL

# 2. 
SELECT teacher.name, dept.name
 FROM teacher 
 INNER JOIN dept ON (teacher.dept=dept.id)

# 3. 
SELECT teacher.name, dept.name
 FROM teacher 
 LEFT JOIN dept ON (teacher.dept=dept.id)

# 4. 
SELECT teacher.name, dept.name
 FROM teacher 
 RIGHT JOIN dept ON (teacher.dept=dept.id)

# 5. 
SELECT name, COALESCE(mobile, '07986 444 2266')
 FROM teacher 

# 6. 
SELECT teacher.name, COALESCE(dept.name, 'None')
 FROM teacher 
 LEFT JOIN dept ON (teacher.dept=dept.id)

# 7. 
SELECT COUNT(name) AS 'Teachers', COUNT(mobile) AS 'Mobile Phones'
  FROM teacher

# 8. 
SELECT dept.name, COUNT(teacher.dept)
  FROM teacher
  RIGHT JOIN dept ON teacher.dept=dept.id
  GROUP BY dept.name

# 9. 
SELECT name, CASE WHEN dept=1 OR dept=2 THEN 'Sci' ELSE 'Art' END
  FROM teacher

# 10.
SELECT name, CASE WHEN dept=1 OR dept=2 THEN 'Sci' WHEN dept=3 THEN 'Art' ELSE 'None' END
  FROM teacher

###

### 8 + Numeric Examples

# 1. 
SELECT A_STRONGLY_AGREE
  FROM nss
  WHERE question='Q01'
  AND institution='Edinburgh Napier University'
  AND subject='(8) Computer Science'

# 2. 
SELECT institution, subject
  FROM nss
  WHERE question='Q15' AND score >= 100

# 3. 
SELECT institution, score
  FROM nss
  WHERE question='Q15'
  AND subject='(8) Computer Science'
  AND score < 50

# 4. 
SELECT subject, SUM(response)
  FROM nss
  WHERE question='Q22'
  AND (subject='(8) Computer Science' OR subject='(H) Creative Arts and Design')
  GROUP BY subject

# 5. 
SELECT subject, SUM(response*A_STRONGLY_AGREE/100)
  FROM nss
  WHERE question='Q22'
  AND (subject='(8) Computer Science' OR subject='(H) Creative Arts and Design')
  GROUP BY subject

# 6. 
SELECT subject, ROUND(SUM(response*A_STRONGLY_AGREE)/SUM(response))
  FROM nss
  WHERE question='Q22'
  AND (subject='(8) Computer Science' OR subject='(H) Creative Arts and Design')
  GROUP BY subject

# 7. 
SELECT institution, ROUND(SUM(response * score) / SUM(response))
  FROM nss
  WHERE question='Q22'
  AND (institution LIKE '%Manchester%')
  GROUP BY institution

# 8. 
SELECT institution, SUM(sample), SUM(CASE WHEN subject = '(8) Computer Science' THEN sample END) AS 'comp'
  FROM nss
  WHERE question='Q01'
  AND (institution LIKE '%Manchester%')
  GROUP BY institution

###

### 9 Self join 

# 1. How many stops are in the database.
SELECT COUNT(*)
  FROM stops

# 2. Find the id value for the stop 'Craiglockhart' 
SELECT id
  FROM stops
  WHERE name = 'Craiglockhart'

# 3. Give the id and the name for the stops on the '4' 'LRT' service. 
SELECT id, name
  FROM stops
  JOIN route ON id=stop
  WHERE num = '4' AND company = 'LRT'

# 4. The query shown gives the number of routes that visit either London Road (149) or Craiglockhart (53). 
# Run the query and notice the two services that link these stops have a count of 2. 
# Add a HAVING clause to restrict the output to these two routes. 
SELECT company, num, COUNT(*)
  FROM route WHERE stop=149 OR stop=53
  GROUP BY company, num
  HAVING COUNT(*) = 2

# 5. 
SELECT a.company, a.num, a.stop, b.stop
  FROM route a 
  JOIN route b ON (a.company=b.company AND a.num=b.num)
  WHERE a.stop=53 AND b.stop=149

# 6. 
SELECT a.company, a.num, stopa.name, stopb.name
  FROM route a 
  JOIN route b ON (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
  WHERE stopa.name='Craiglockhart' AND stopb.name='London Road'

# 7. 
SELECT a.company, a.num
  FROM route a 
  JOIN route b ON(a.company=b.company AND a.num=b.num)
  WHERE a.stop = 115 AND b.stop = 137
  GROUP BY a.company, a.num

# 8. 
SELECT a.company, a.num
  FROM route a JOIN route b ON a.company = b.company AND a.num = b.num
  JOIN stops stopa ON stopa.id = a.stop
  JOIN stops stopb ON stopb.id = b.stop
  WHERE stopa.name = 'Craiglockhart' AND stopb.name = 'Tollcross'
  GROUP BY a.company, a.num

# 9. 
SELECT stopb.name, a.company, a.num
  FROM route a 
  JOIN route b ON (a.company = b.company AND a.num = b.num)
  JOIN stops stopa ON a.stop = stopa.id 
  JOIN stops stopb ON b.stop = stopb.id
  WHERE a.company = 'LRT' AND stopa.name = 'Craiglockhart'

# 10.
SELECT DISTINCT first.num, first.company, first.name, second.num, second.company
  FROM
  (SELECT stops.name, a.company, a.num 
   FROM route a 
   JOIN route B ON (a.company = b.company AND a.num = b.num)
   JOIN stops ON (stops.id = a.stop)
   WHERE b.stop = (SELECT id FROM stops WHERE name = 'Craiglockhart')) AS first

  JOIN

  (SELECT stops.name, a.company, a.num FROM route a
   JOIN route b ON (a.company = b.company AND a.num = b.num)
   JOIN stops ON (stops.id = a.stop)
   WHERE b.stop = (SELECT id FROM stops WHERE name = 'Sighthill')) AS second

  WHERE first.name = second.name

###