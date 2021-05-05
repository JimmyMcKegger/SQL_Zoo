--1
SELECT id, title
 FROM movie
 WHERE yr=1962

--2
SELECT yr
FROM movie
WHERE title = 'Citizen Kane'

--3
SELECT id, title, yr
FROM movie
WHERE title LIKE '%Star Trek%'

--4
SELECT id
FROM actor
WHERE name = 'Glenn Close'

--5
SELECT id
FROM movie
WHERE title = 'Casablanca'

--6 
SELECT name
FROM actor
WHERE id IN (SELECT actorid 
            FROM casting 
            WHERE movieid=27)

--7
SELECT name
FROM actor
WHERE id IN (SELECT actorid 
            FROM casting 
            WHERE movieid=35)

--8
SELECT title
FROM movie
WHERE id IN (SELECT movieid 
            FROM casting 
            WHERE actorid = (SELECT id 
                            FROM actor 
                            WHERE name = 'Harrison Ford'))

--9
SELECT title
FROM movie
WHERE id IN (SELECT movieid 
            FROM casting 
            WHERE actorid = (SELECT id 
                            FROM actor 
                            WHERE name = 'Harrison Ford')
            AND ord !=1)

--10
SELECT title, name
FROM movie
JOIN casting
ON id=movieid
JOIN actor
ON actor.id=actorid
WHERE ord = 1
AND yr = 1962

--11
SELECT yr,COUNT(title) FROM
  movie JOIN casting ON movie.id=movieid
        JOIN actor   ON actorid=actor.id
WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 1

--12
SELECT movie.title, actor.name
FROM movie
JOIN casting
ON movie.id = casting.movieid
JOIN actor
ON casting.actorid = actor.id
WHERE movie.id IN   (SELECT casting.movieid 
                    FROM casting 
                    WHERE actorid = (SELECT id 
                                    FROM actor 
                                    WHERE name = 'Julie Andrews'))
                    AND casting.ord = 1

--13
SELECT name
FROM actor
JOIN casting
    ON (actor.id = casting.actorid
    AND (SELECT COUNT(ord) 
        FROM casting 
        WHERE actorid = actor.id 
        AND ord=1) >= 15)
GROUP BY name

--14
SELECT title, COUNT(actorid)
FROM movie
JOIN casting
    ON id = movieid
WHERE movie.yr = 1978
GROUP BY title
ORDER BY COUNT(actorid) DESC, title

--15
SELECT DISTINCT name
FROM actor
JOIN casting 
    ON id = actorid
WHERE movieid IN (SELECT movieid 
                    FROM casting 
                    JOIN actor 
                    ON actorid = id 
                    WHERE name = 'Art Garfunkel')
AND name != 'Art Garfunkel'