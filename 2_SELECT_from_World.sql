# Question 1
SELECT name, continent, population 
FROM world;

# Question 2
SELECT name 
FROM world
WHERE population > 200000000;

# Question 3
SELECT name, gdp/population
FROM world
WHERE population > 200000000;

# Question 4
SELECT name, population/1000000
FROM world
WHERE continent = 'South America';

# Question 5
SELECT name, population
FROM world
WHERE name IN ('France', 'Germany', 'Italy');

# Question 6
SELECT name
FROM world
WHERE name LIKE '%United%';

# Question 7
SELECT name, population, area
FROM world
WHERE area > 3000000 OR population > 250000000;

# Question 8
SELECT name, population, area
FROM world
WHERE (area > 3000000 OR population > 250000000) AND NOT 
  (area > 3000000 AND population > 250000000);

# Question 9
SELECT name, ROUND(population/1000000, 2), ROUND(gdp/1000000000, 2)
FROM world
WHERE continent = 'South America';

# Question 10
SELECT name, ROUND(gdp/population, -3)
FROM world
WHERE gdp > 1000000000000;

# Question 11
SELECT name, 
  CASE WHEN continent = 'Oceania' THEN 'Australasia'
  ELSE continent END
FROM world
WHERE name LIKE 'N%';

# Question 12
SELECT name, 
  CASE WHEN continent = 'Europe' THEN 'Eurasia'
  WHEN continent = 'Asia' THEN 'Eurasia'
  WHEN continent IN ('North America', 'South America',  'Caribbean') THEN 'America'
  ELSE continent END
FROM world
WHERE name LIKE 'A%' OR name LIKE 'B%';

# Question 13
SELECT name, continent,
  CASE WHEN continent = 'Oceania' THEN 'Australasia'
  WHEN continent IN ('Eurasia', 'Turkey') THEN 'Europe/Asia'
  WHEN continent = 'Caribbean' AND name LIKE 'B%' THEN 'North America'
  WHEN continent = 'Caribbean' THEN 'South America'
  ELSE continent END
FROM world
ORDER BY name;