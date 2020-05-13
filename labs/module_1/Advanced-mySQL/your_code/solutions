
--
-- Challenge 1
--

SELECT titleauthor.title_id, titleauthor.au_id, titles.advance * titleauthor.royaltyper/100 AS Advance, titles.price * sales.qty * titles.royalty/100 AS royalty
FROM titleauthor
LEFT JOIN titles on titles.title_id = titleauthor.title_id
LEFT JOIN sales on sales.title_id = titleauthor.title_id


SELECT title_id, au_id, SUM(royalty) as total_royalty, Advance
FROM (SELECT titleauthor.title_id, titleauthor.au_id, titles.advance * titleauthor.royaltyper / 100 as Advance, titles.price * 	sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 as royalty
FROM titleauthor
LEFT JOIN titles on titles.title_id = titleauthor.title_id
LEFT JOIN sales on sales.title_id = titleauthor.title_id)
AS Royalties_1
GROUP BY au_id, title_id;


SELECT au_id, SUM(total_royalty + Advance) as profits
FROM (SELECT title_id, au_id, SUM(royalty) as total_royalty, Advance
FROM (SELECT titleauthor.title_id, titleauthor.au_id, titles.advance * titleauthor.royaltyper / 100 as Advance, titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 as royalty
FROM titleauthor
LEFT JOIN titles on titles.title_id = titleauthor.title_id
LEFT JOIN sales on sales.title_id = titleauthor.title_id)
AS Royalties_2
GROUP BY au_id, title_id)
as Royalties_2
GROUP BY au_id
ORDER BY profits DESC
LIMIT 3;

--
-- Challenge 2
--


CREATE TEMPORARY TABLE Royalties_1_1
SELECT titleauthor.title_id, titleauthor.au_id, titles.advance * titleauthor.royaltyper / 100 as advance, titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 as royalty
FROM titleauthor
LEFT JOIN titles on titles.title_id = titleauthor.title_id
LEFT JOIN sales on sales.title_id = titleauthor.title_id;


CREATE TEMPORARY TABLE Royalties_2_2
SELECT title_id, au_id, SUM(royalty) as total_royalty, Advance
FROM Royalties_1_1
GROUP BY au_id, title_id, Advance;


SELECT au_id, SUM(total_royalty + Advance) as profits
FROM Royalties_2_2
GROUP BY au_id
ORDER BY profits DESC
LIMIT 3;
--
-- Challenge 3
--

CREATE TABLE most_profiting_authors
SELECT au_id, SUM(total_royalty + advance) as profits
FROM(SELECT title_id, au_id, SUM(sales_royalty) AS total_royalty, advance
FROM (SELECT titleauthor.title_id, titleauthor.au_id, titles.advance * titleauthor.royaltyper / 100 AS advance, titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 AS sales_royalty
FROM titleauthor
LEFT JOIN titles on titles.title_id = titleauthor.title_id
LEFT JOIN sales on sales.title_id = titleauthor.title_id)
AS Royalties_1
GROUP BY title_id, au_id)
AS Royalties_2
GROUP BY au_id
ORDER BY profits DESC;