#Challenge 1:
SELECT titleau.au_id as AUTHOR_ID, auth.au_lname as LAST_NAME, auth.au_fname as FIRST_NAME, titles.title as TITLE, pub.pub_name as PUBLISHER
FROM publications.titleauthor titleau
LEFT JOIN publications.authors auth ON titleau.au_ID = auth.au_ID
LEFT JOIN publications.titles titles ON titleau.title_ID = titles.title_id
LEFT JOIN publications.publishers pub ON titles.pub_id = pub.pub_id;

#Challenge 2:
SELECT titleau.au_id as AUTHOR_ID, auth.au_lname as LAST_NAME, auth.au_fname as FIRST_NAME, pub.pub_name as PUBLISHER, COUNT(titleau.title_id) as TITLE_COUNT
FROM publications.titleauthor titleau
LEFT JOIN publications.authors auth ON titleau.au_ID = auth.au_ID
LEFT JOIN publications.titles titles ON titleau.title_ID = titles.title_id
LEFT JOIN publications.publishers pub ON titles.pub_id = pub.pub_id
GROUP BY titleau.au_id, pub.pub_name;

#Challenge 3:
SELECT titleau.au_id as AUTHOR_ID, auth.au_lname as LAST_NAME, auth.au_fname as FIRST_NAME, SUM(sales.qty) as TOTAL
FROM publications.titleauthor titleau
LEFT JOIN publications.authors auth ON titleau.au_ID = auth.au_ID
LEFT JOIN publications.sales sales ON titleau.title_ID = sales.title_id
GROUP BY titleau.au_id
ORDER BY TOTAL DESC
LIMIT 3;


#Challenge 4:
SELECT auth.au_id as AUTHOR_ID, auth.au_lname as LAST_NAME, auth.au_fname as FIRST_NAME, COALESCE(SUM(sales.qty),0) as TOTAL
FROM publications.authors auth
LEFT JOIN publications.titleauthor titleau ON titleau.au_ID = auth.au_ID
LEFT JOIN publications.sales sales ON titleau.title_ID = sales.title_id
GROUP BY auth.au_id
ORDER BY TOTAL DESC;
