--1
SELECT matchid, player
FROM goal 
  WHERE teamid = 'GER'

--2
SELECT id,stadium,team1,team2
FROM game
WHERE id= 1012

--3
SELECT player, teamid, stadium, mdate
  FROM game 
    JOIN goal 
    ON (game.id = goal.matchid)
  WHERE teamid='GER'

--4
SELECT game.team1, game.team2, goal.player
  FROM game
    JOIN goal 
    ON (game.id = goal.matchid)
  WHERE goal.player LIKE 'Mario%'

--5
SELECT g.player, g.teamid, e. coach, g.gtime
  FROM goal g
JOIN eteam e
ON g.teamid = e.id
 WHERE gtime<=10

--6
SELECT g.mdate, e.teamname
FROM game g
JOIN eteam e
ON g.team1 = e.id
WHERE e.coach = 'Fernando Santos'

--7
SELECT go.player
FROM goal go
JOIN game ga
ON go.matchid = ga.id
WHERE ga.stadium = 'National Stadium, Warsaw'

--8
SELECT DISTINCT o.player
  FROM goal o 
JOIN game a
ON id = matchid
WHERE (a.team1='GER' OR a.team2='GER')
AND o.player IN (SELECT player from goal x WHERE teamid != 'GER')

--9
SELECT teamname, COUNT(player)
  FROM eteam 
    JOIN goal 
    ON id=teamid
 GROUP BY teamname


--10
SELECT stadium, COUNT(matchid)
FROM game
  JOIN goal 
  ON ​id=matchid
GROUP BY stadium

--11
SELECT matchid, mdate, COUNT(player) AS goals
FROM game
  JOIN goal 
  ON (matchid=id AND (team1 = 'POL' OR team2 = 'POL'))
GROUP BY matchid, mdate

--12
SELECT matchid, mdate, COUNT(player)
FROM game
  JOIN goal
  ON id=matchid AND (team1 = 'GER' OR team2 = 'GER') AND teamid = 'GER'
GROUP BY matchid, mdate

--13
SELECT mdate, 
  team1, 
  SUM(CASE WHEN teamid = team1 THEN 1 ELSE 0 END) AS score1,
  team2,
  SUM(CASE WHEN teamid = team2 THEN 1 ELSE 0 END) AS score2 
FROM game 
  LEFT JOIN goal 
  ON (id = matchid)
GROUP BY mdate, team1, team2
ORDER BY mdate, matchid, team1, team2