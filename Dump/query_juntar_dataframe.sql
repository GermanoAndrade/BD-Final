SELECT ft_w.name AS "Winner",
	   ft_l.name AS "Loser", 
	   SUBSTR(f.date, 1, 10) AS "date", 
	   SUBSTR(f.date, 1, 4) AS "year", 
	   l.city || ", " || l.state || ", " || l.country AS "location", 
	   l.country AS "country", 
	   f.title_bout AS "title_bout", 
	   wc.name AS "weight_class", 
	   ft_w.gender AS "gender", 
	   SUBSTR(f.date, 1, 4) - ft_w.born_year AS "W_age", 
	   SUBSTR(f.date, 1, 4) - ft_l.born_year AS "L_age", 
	   ft_w.titles as "W_titles", 
	   ft_l.titles as "L_titles" 
FROM fight as f INNER JOIN fighters as ft_w ON f.id_winner = ft_w.id_fighters 
INNER JOIN fighters AS ft_l ON f.id_loser = ft_l.id_fighters
INNER JOIN location AS l ON f.id_location = l.id_location
INNER JOIN weight_class as wc ON f.id_weight_class = wc.id_weight_class
ORDER BY f.id_fight;