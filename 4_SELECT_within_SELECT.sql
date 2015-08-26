# Question 1
SELECT name 
FROM world
WHERE population >
  (SELECT population 
   FROM world
   WHERE name = 'Russia')

# Question 2
SELECT name
FROM world
WHERE continent = 'Europe' AND gdp/population >
  (SELECT gdp/population
   FROM world
   WHERE name = 'United Kingdom');

# Question 3
SELECT name, continent
FROM world
WHERE continent IN
  (SELECT continent
   FROM world
   WHERE name IN ('Argentina', 'Australia'))
ORDER BY name;

# Question 4
SELECT name, population
FROM world
WHERE population >
  (SELECT population
   FROM world
   WHERE name = 'Canada') 
AND population <
  (SELECT population
   FROM world
   WHERE name = 'Poland');

# Question 5
SELECT name, CONCAT(ROUND(population /
  (SELECT population
   FROM world
   WHERE name = 'Germany') * 100), '%')
FROM world
WHERE continent = 'Europe';

# Question 6
SELECT name
FROM world
WHERE gdp > ALL
  (SELECT gdp
   FROM world
   WHERE continent = 'Europe' AND gdp > 0);

# Question 7
SELECT continent, name, area
FROM world x
WHERE area >= ALL
  (SELECT area FROM world y
   WHERE y.continent = x.continent
   AND area > 0);

# Question 8
SELECT continent, name
FROM world x
WHERE name <= ALL
  (SELECT name FROM world y
   WHERE y.continent = x.continent);
