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