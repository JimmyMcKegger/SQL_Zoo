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
