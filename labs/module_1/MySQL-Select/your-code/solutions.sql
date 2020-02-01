SELECT authors.au_id, authors.au_lname, authors.au_fname,titles.title,publishers.pub_name FROM authors, titles, publishers,titleauthor WHERE
titleauthor.au_id=authors.au_id AND  titleauthor.title_id=titles.title_id AND titles.pub_id=publishers.pub_id;

SELECT authors.au_id, authors.au_lname, authors.au_fname,publishers.pub_name, count(*) AS title_count FROM authors, titles, publishers,titleauthor WHERE
titleauthor.au_id=authors.au_id AND  titleauthor.title_id=titles.title_id AND titles.pub_id=publishers.pub_id GROUP BY authors.au_id,publishers.pub_name;

SELECT authors.au_id, authors.au_lname, authors.au_fname, SUM(sales.qty) AS total_sales FROM authors, titleauthor, titles, sales 
WHERE
titleauthor.au_id=authors.au_id AND 
titleauthor.title_id=titles.title_id AND
titles.title_id=sales.title_id 
GROUP BY authors.au_id 
ORDER BY total_sales DESC LIMIT 3;