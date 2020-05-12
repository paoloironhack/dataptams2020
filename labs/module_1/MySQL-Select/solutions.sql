--
-- Challenge 1
--

SELECT authors.au_id as AUTHOR_ID, authors.au_lname as LAST_NAME, authors.au_fname as FIRST_NAME, titles.title as TITLE, publishers.pub_name as PUBLISHER
FROM authors
LEFT JOIN titleauthor ON titleauthor.au_id = authors.au_id
LEFT JOIN titles ON titleauthor.title_id = titles.title_id
LEFT JOIN publishers ON titles.pub_id = publishers.pub_id;

--
-- Challenge 2
--

PUBLISHER, COUNT(titles.title_id) as TITLE_COUNT
FROM authors
LEFT JOIN titleauthor ON titleauthor.au_id = authors.au_id
LEFT JOIN titles ON titleauthor.title_id = titles.title_id
LEFT JOIN publishers ON titles.pub_id = publishers.pub_id
GROUP BY authors.au_id, publishers.pub_name;

--
-- Challenge 3
--

SELECT authors.au_id as AUTHOR_ID, authors.au_lname as LAST_NAME, authors.au_fname as FIRST_NAME, SUM(sales.qty) as TOTAL
FROM authors 
LEFT JOIN titleauthor on titleauthor.au_id = authors.au_id
LEFT JOIN sales on sales.title_id = titleauthor.title_id
GROUP BY authors.au_id
ORDER BY TOTAL DESC
LIMIT 3;

--
-- Challenge 4
--

SELECT authors.au_id as AUTHOR_ID, authors.au_lname as LAST_NAME, authors.au_fname as FIRST_NAME, COALESCE(SUM(sales.qty),0) as TOTAL
FROM authors
LEFT JOIN titleauthor on titleauthor.au_id = authors.au_id
LEFT JOIN sales on sales.title_id = titleauthor.title_id
GROUP BY authors.au_id
ORDER BY TOTAL DESC;