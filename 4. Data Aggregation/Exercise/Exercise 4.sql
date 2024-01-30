SELECT * FROM wizzard_deposits;

-- Exercise 1
 SELECT 	
COUNT(*) AS 'count'
FROM wizzard_deposits;

-- Exercise 2
 SELECT 
 MAX(magic_wand_size) AS 'longest_magic_wand'
 FROM wizzard_deposits;