# Question 1
SELECT id, title
FROM movie
WHERE yr = 1962;

# Question 2
SELECT yr
FROM movie
WHERE title = 'Citizen Kane';

# Question 3
SELECT id, title, yr
FROM movie
WHERE title LIKE '%Star Trek%';

# Question 4
SELECT title
FROM movie
WHERE id IN (11768, 11955, 21191);

# Question 5
SELECT id
FROM actor
WHERE name = 'Glenn Close';

# Question 6
SELECT id
FROM movie
WHERE title = 'Casablanca';

# Question 7
SELECT name
FROM actor
JOIN casting ON (id = actorid)
WHERE movieid = 11768;

# Question 8
SELECT name
FROM actor
JOIN casting ON (id = actorid)
WHERE movieid = 
  (SELECT id
   FROM movie
   WHERE title = 'Alien');

# Question 9
SELECT title
FROM movie
JOIN casting ON (id = movieid)
WHERE actorid = 
  (SELECT id
   FROM actor
   WHERE name = 'Harrison Ford');

# Question 10
SELECT title
FROM movie
JOIN casting ON (id = movieid)
WHERE actorid = 
  (SELECT id
   FROM actor
   WHERE name = 'Harrison Ford') AND ord != 1;

# Question 11
SELECT title, name
FROM movie 
JOIN casting ON (movie.id = movieid) 
JOIN actor ON (actor.id = actorid)
WHERE yr = 1962 AND ord = 1;

# Question 12
SELECT yr, COUNT(title) 
FROM movie 
JOIN casting ON movie.id = movieid
JOIN actor ON actorid = actor.id
WHERE name = 'John Travolta'
GROUP BY yr
HAVING COUNT(title) = 
  (SELECT MAX(c) 
   FROM
    (SELECT yr,COUNT(title) AS c 
     FROM movie JOIN casting ON movie.id = movieid
     JOIN actor ON actorid = actor.id
     WHERE name='John Travolta'
     GROUP BY yr) AS t
  )

# Question 13
SELECT title, name
FROM casting 
JOIN movie ON (movieid = movie.id)
JOIN actor ON (actorid = actor.id)
WHERE ord = 1 AND movieid IN
  (SELECT movieid
   FROM casting
   WHERE actorid IN (
     SELECT id FROM actor
     WHERE name='Julie Andrews'));

# Question 14
SELECT name
FROM actor
JOIN casting ON (id = actorid)
WHERE ord = 1
GROUP BY name HAVING COUNT(ord) >= 30;

# Question 15
SELECT title, COUNT(actorid)
FROM movie
JOIN casting ON (movieid = id)
WHERE yr = 1978
GROUP BY title
ORDER BY COUNT(actorid) DESC;

# Question 16
SELECT name 
FROM actor 
JOIN casting ON (actorid = actor.id) 
JOIN movie ON (movieid = movie.id)
WHERE name != 'Art Garfunkel' AND movieid IN
  (SELECT movieid 
   FROM actor 
   JOIN casting ON (actorid = actor.id)   
   JOIN movie ON (movieid = movie.id)
   WHERE name = 'Art Garfunkel');

