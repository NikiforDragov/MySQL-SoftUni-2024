SELECT title
FROM books
WHERE SUBSTRING(title, 1, 4) = 'The '
ORDER BY id;

SELECT 
REPLACE(title, 'The', '***') AS title
FROM books
WHERE SUBSTRING(title, 1, 4) = 'The '
ORDER BY id;

SELECT title
FROM books
WHERE title LIKE 'Harry Potter%'
ORDER BY id;

SELECT ROUND(SUM(cost), 2)
FROM books;

SELECT 
CONCAT_WS(' ', first_name, last_name) AS 'Full Name',
TIMESTAMPDIFF(DAY, born, died) AS 'Days Lived'
FROM authors;

SELECT * 
FROM authors;
