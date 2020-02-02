SELECT authors.au_id, authors.au_lname, authors.au_fname,titles.title,publishers.pub_name FROM authors, titles, publishers,titleauthor 
WHERE
titleauthor.au_id=authors.au_id AND  titleauthor.title_id=titles.title_id AND titles.pub_id=publishers.pub_id;

SELECT authors.au_id, authors.au_lname, authors.au_fname,publishers.pub_name, count(*) AS title_count FROM authors, titles, publishers,titleauthor 
WHERE
titleauthor.au_id=authors.au_id AND  titleauthor.title_id=titles.title_id AND titles.pub_id=publishers.pub_id 
GROUP BY 
authors.au_id,publishers.pub_name;

SELECT authors.au_id, authors.au_lname, authors.au_fname, SUM(sales.qty) AS total_sales FROM authors, titleauthor, titles, sales 
WHERE
titleauthor.au_id=authors.au_id AND 
titleauthor.title_id=titles.title_id AND
titles.title_id=sales.title_id 
GROUP BY authors.au_id 
ORDER BY total_sales DESC LIMIT 3;

SELECT authors.au_id, authors.au_lname, authors.au_fname, COALESCE(SUM(sales.qty),0) AS total_sales
FROM authors
LEFT JOIN publications.titleauthor titleauthor
ON titleauthor.au_id = authors.au_id
LEFT JOIN publications.titles titles
ON titles.title_id = titleauthor.title_id
LEFT JOIN publications.sales sales
ON sales.title_id = titles.title_id
GROUP BY authors.au_id
ORDER BY total_sales DESC;


/* SELECT Table4.company, table1.id, table1.value
FROM Table1
   INNER JOIN Table2
	ON Table2.table1_id = Table1.id
    INNER JOIN Table3
        ON Table3.table2_id = Table2.id
    INNER JOIN Table4
        ON Table4.table3_id = Table3.id
*/
