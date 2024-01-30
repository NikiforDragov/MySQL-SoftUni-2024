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
 
 -- Exercise 4
 SELECT 
 deposit_group
 FROM wizzard_deposits
 GROUP BY deposit_group
 ORDER BY MIN(magic_wand_size)
 LIMIT 1;
 
 -- Exercise 5
 SELECT 
 deposit_group,
 SUM(deposit_amount) AS 'total_sum'
 FROM wizzard_deposits
 GROUP BY deposit_group
 ORDER BY `total_sum`;

 -- Exercise 6
 SELECT 
 deposit_group,
 SUM(deposit_amount) AS 'total_sum'
 FROM wizzard_deposits
 WHERE magic_wand_creator = 'Ollivander family'
 GROUP BY deposit_group
 ORDER BY deposit_group;
 
 -- Exercise 7
 SELECT 
 deposit_group,
 SUM(deposit_amount) AS 'total_sum'
 FROM wizzard_deposits
 WHERE magic_wand_creator = 'Ollivander family'
 GROUP BY deposit_group
 HAVING `total_sum` < 150000
 ORDER BY `total_sum` DESC;
 
 
 
 
 
 
 
 