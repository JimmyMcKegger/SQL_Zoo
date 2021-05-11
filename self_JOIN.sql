-- https://sqlzoo.net/wiki/Self_join

--1
SELECT COUNT(id)
FROM stops

--2
SELECT id
FROM stops
WHERE name = 'Craiglockhart'

--3
SELECT id, name
FROM stops
WHERE id IN (SELECT stop 
            FROM route 
            WHERE company = 'LRT' 
            AND num = '4')

--4
SELECT company, num, COUNT(*)
FROM route WHERE stop=149 OR stop=53
GROUP BY company, num
HAVING COUNT(*) > 1

--5
SELECT a.company, a.num, a.stop, b.stop
FROM route a 
    JOIN route b 
    ON (a.company=b.company 
        AND a.num=b.num)
WHERE a.stop = 53
AND b.stop=(SELECT id 
            FROM stops 
            WHERE name = 'London Road')

--6
SELECT a.company, a.num, stopa.name, stopb.name
FROM route a 
  JOIN route b 
  ON (a.company=b.company 
  AND a.num=b.num)
    JOIN stops stopa 
    ON (a.stop=stopa.id)
    JOIN stops stopb 
    ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart'
AND stopb.name='London Road'

--7
SELECT DISTINCT a.company, a.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Haymarket'
AND stopb.name='Leith'

--8
SELECT DISTINCT a.company, a.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart'
AND stopb.name='Tollcross'

--9
SELECT DISTINCT stopb.name, a.company, a.num
FROM route a 
  JOIN route b
  ON (a.company = b.company AND a.num = b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart'

--10
