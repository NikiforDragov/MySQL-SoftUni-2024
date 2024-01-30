SELECT * FROM wizzard_deposits;

-- Exercise 1
 SELECT 	
COUNT(*) AS 'count'
FROM wizzard_deposits;

-- Exercise 2
 SELECT 
 MAX(magic_wand_size) AS 'longest_magic_wand'
 FROM wizzard_deposits;
 
 -- Exercise 3
 SELECT 
 deposit_group,
 MAX(magic_wand_size) AS 'longest_magic_wand'
 FROM wizzard_deposits
 GROUP BY deposit_group
 ORDER BY `longest_magic_wand`, deposit_group;
 
 