SELECT authors.au_id, titleauthor.title_id, titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 as sales_royalty, titles.advance * titleauthor.royaltyper / 100 as advance
FROM authors
INNER JOIN titleauthor
ON authors.au_id = titleauthor.au_id
INNER JOIN titles
ON titleauthor.title_id = titles.title_id
INNER JOIN roysched
ON titles.title_id = roysched.title_id
INNER JOIN sales
ON titles.title_id = sales.title_id;
