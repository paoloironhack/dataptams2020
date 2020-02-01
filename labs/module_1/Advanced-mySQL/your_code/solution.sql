#Challenge 1
#Step 1
SELECT 	ta.title_id AS Title_ID, 
		ta.au_id AS Author_ID,
		titles.advance * ta.royaltyper / 100 AS Advance,
		titles.price * sales.qty * titles.royalty / 100 * ta.royaltyper / 100 AS Royalty
FROM titleauthor ta
LEFT JOIN titles ON ta.title_ID = titles.title_id
LEFT JOIN sales ON ta.title_ID = sales.title_id;

#Step 2
SELECT Title_ID, Author_ID, SUM(Royalty as Total_Royalty), Advance
FROM (
	SELECT 	ta.title_id AS Title_ID, 
			ta.au_id AS Author_ID,
			titles.advance * ta.royaltyper / 100 AS Advance,
			titles.price * sales.qty * titles.royalty / 100 * ta.royaltyper / 100 AS Royalty
	FROM titleauthor ta
	LEFT JOIN titles ON ta.title_ID = titles.title_id
	LEFT JOIN sales ON ta.title_ID = sales.title_id)
	AS step1
GROUP BY Title_ID, Author_ID;

#Step 3
SELECT Author_ID, SUM(Total_Royalty+Advance) as Profits
FROM(
	SELECT Title_ID, Author_ID, SUM(Royalty) as Total_Royalty, Advance
	FROM (
		SELECT 	ta.title_id AS Title_ID, 
				ta.au_id AS Author_ID,
				titles.advance * ta.royaltyper / 100 AS Advance,
				titles.price * sales.qty * titles.royalty / 100 * ta.royaltyper / 100 AS Royalty
		FROM titleauthor ta
		LEFT JOIN titles ON ta.title_ID = titles.title_id
		LEFT JOIN sales ON ta.title_ID = sales.title_id)
		AS step1
	GROUP BY Title_ID, Author_ID
	)
	AS step2
GROUP BY Author_ID
ORDER BY Profits DESC
LIMIT 3;



#Challenge 2:
#Step 1
#Join required tables to make sure we have all info, and apply formulas to calculate advance and royalties.
#Save it in a TEMP Table so I can reaccess
CREATE TEMPORARY TABLE publications.step1
SELECT 	ta.title_id AS Title_ID, 
		ta.au_id AS Author_ID,
		titles.advance * ta.royaltyper / 100 AS Advance,
		titles.price * sales.qty * titles.royalty / 100 * ta.royaltyper / 100 AS Royalty
FROM titleauthor ta
LEFT JOIN titles ON ta.title_ID = titles.title_id
LEFT JOIN sales ON ta.title_ID = sales.title_id;

#Checking output. Authors and books can be duplicated:
SELECT * FROM publications.step1;

#Step 2
CREATE TEMPORARY TABLE publications.step2
SELECT Title_ID, Author_ID, SUM(Royalty) AS Total_Royalty, Advance
FROM step1
GROUP BY Title_ID, Author_ID,Advance;

#Checking output. Authors and books should NOT be duplicated::
SELECT * FROM publications.step2;

#Step 3
#Calculate final result
SELECT Author_ID, SUM(Total_Royalty + Advance) as Profits
FROM step2
GROUP BY Author_ID
ORDER BY Profits DESC
LIMIT 3;



#Challenge 3
#Create new table and save results there
CREATE TABLE publications.most_profiting_authors
SELECT Author_ID, SUM(Total_Royalty+Advance) as Profits
FROM(
	SELECT Title_ID, Author_ID, SUM(Royalty) as Total_Royalty, Advance
	FROM (
		SELECT 	ta.title_id AS Title_ID, 
				ta.au_id AS Author_ID,
				titles.advance * ta.royaltyper / 100 AS Advance,
				titles.price * sales.qty * titles.royalty / 100 * ta.royaltyper / 100 AS Royalty
		FROM titleauthor ta
		LEFT JOIN titles ON ta.title_ID = titles.title_id
		LEFT JOIN sales ON ta.title_ID = sales.title_id)
		AS step1
	GROUP BY Title_ID, Author_ID
	)
	AS step2
GROUP BY Author_ID;
