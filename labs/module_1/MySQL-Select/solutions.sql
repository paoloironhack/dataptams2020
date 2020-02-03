USE publications;


#Challenge 1
select authors.au_id, authors.au_lname,authors.au_fname, titles.title, publishers.pub_name
FROM titleauthor
LEFT JOIN titles ON titleauthor.title_id = titles.title_id
LEFT JOIN authors ON titleauthor.au_id = authors.au_id
LEFT JOIN publishers ON titles.pub_id = publishers.pub_id;


#Challenge 2
CREATE TEMPORARY TABLE publications.authors_pub_name
select authors.au_id, authors.au_lname,authors.au_fname, titles.title, publishers.pub_name
FROM titleauthor
LEFT JOIN titles ON titleauthor.title_id = titles.title_id
LEFT JOIN authors ON titleauthor.au_id = authors.au_id
LEFT JOIN publishers ON titles.pub_id = publishers.pub_id;


SELECT publications.authors_pub_name.au_id, publications.authors_pub_name.au_lname, publications.authors_pub_name.au_fname,publications.authors_pub_name.pub_name,COUNT(authors_pub_name.title) AS Titles
FROM publications.authors_pub_name
GROUP BY publications.authors_pub_name.au_id, publications.authors_pub_name.au_lname, publications.authors_pub_name.au_fname,publications.authors_pub_name.pub_name;


#Challenge 3
CREATE TEMPORARY TABLE publications.authors_pub_titles
SELECT publications.authors_pub_name.au_id, publications.authors_pub_name.au_lname, publications.authors_pub_name.au_fname,publications.authors_pub_name.pub_name,COUNT(authors_pub_name.title) AS Titles
FROM publications.authors_pub_name
GROUP BY publications.authors_pub_name.au_id, publications.authors_pub_name.au_lname, publications.authors_pub_name.au_fname,publications.authors_pub_name.pub_name;


SELECT publications.authors_pub_titles.au_id,publications.authors_pub_titles.au_fname,publications.authors_pub_titles.au_lname, COUNT(publications.authors_pub_titles.titles) AS Titles
FROM publications.authors_pub_titles
GROUP BY publications.authors_pub_titles.au_id,publications.authors_pub_titles.au_fname,publications.authors_pub_titles.au_lname
ORDER BY COUNT(*) DESC
LIMIT 3;




#Challenge 4
#I did not manage to get this right. I got to a list of 23 authors but cannot show the authors name…


CREATE TEMPORARY TABLE publications.authors_titles 
SELECT publications.authors_pub_titles.au_id,publications.authors_pub_titles.au_fname,publications.authors_pub_titles.au_lname, COUNT(publications.authors_pub_titles.titles) AS Titles
FROM publications.authors_pub_titles
GROUP BY publications.authors_pub_titles.au_id,publications.authors_pub_titles.au_fname,publications.authors_pub_titles.au_lname
ORDER BY COUNT(*) DESC;


SELECT 
publications.authors_titles.au_id,publications.authors_titles.au_fname,publications.authors_titles.au_lname,publications.authors_titles.titles
FROM publications.authors_titles
RIGHT JOIN authors ON publications.authors_titles.au_id = authors.au_id;