SELECT authors.au_id, titleauthor.title_id, sales.qty*titles.royalty, titles.advance/count(authors.au_id) 
FROM authors
INNER JOIN titleauthor
ON authors.au_id = titleauthor.au_id
INNER JOIN titles
ON titleauthor.title_id = titles.title_id
INNER JOIN roysched
ON titles.title_id = roysched.title_id
INNER JOIN sales
ON titles.title_id = sales.title_id
GROUP BY titleauthor.title_id