
SELECT t.title_id a.au_id, t.advance * titleauthor.royaltyper / 100 as advance, t.price * s.qty * t.royalty / 100 * titleauthor.royaltyper / 100 as royalty, SUM(royalty)
    FROM authors a
    LEFT JOIN titleauthor on titleauthor.au_id = a.au_id
    LEFT JOIN titles t on t.title_id = titleauthor.title_id
    LEFT JOIN sales s on s.title_id = t.title_id
    GROUP BY a.au_id

SELECT title_id, au_id, SUM(royalty) as sum_royalty, advance
	FROM (SELECT t.title_id, a.au_id, t.advance * titleauthor.royaltyper / 100 as advance, t.price * s.qty * t.royalty / 100 * titleauthor.royaltyper / 100 as royalty
		FROM authors a
		LEFT JOIN titleauthor on titleauthor.au_id = a.au_id
		LEFT JOIN titles t on t.title_id = titleauthor.title_id
		LEFT JOIN sales s on s.title_id = t.title_id)
	as `table`
	GROUP BY au_id, title_id

SELECT au_id, SUM(sum_royalty + advance) as profit
	FROM (SELECT title_id, au_id, SUM(royalty) as sum_royalty, advance
		FROM (SELECT t.title_id, a.au_id, t.advance * titleauthor.royaltyper / 100 as advance, t.price * s.qty * t.royalty / 100 * titleauthor.royaltyper / 100 as royalty
				FROM authors a
				LEFT JOIN titleauthor on titleauthor.au_id = a.au_id
				LEFT JOIN titles t on t.title_id = titleauthor.title_id
				LEFT JOIN sales s on s.title_id = t.title_id)
			as `table`
			GROUP BY au_id, title_id)
		as `table2`
	GROUP BY au_id
	ORDER BY profit DESC
	LIMIT 3

CREATE TEMPORARY TABLE temp_au_tit_royalt_adv
SELECT t.title_id, a.au_id, t.advance * titleauthor.royaltyper / 100 as advance, t.price * s.qty * t.royalty / 100 * titleauthor.royaltyper / 100 as royalty, SUM(royalty)
    FROM authors a
    LEFT JOIN titleauthor on titleauthor.au_id = a.au_id
    LEFT JOIN titles t on t.title_id = titleauthor.title_id
    LEFT JOIN sales s on s.title_id = t.title_id
    GROUP BY a.au_id

CREATE TEMPORARY TABLE temp_au_tit_sumroyalt_adv
SELECT title_id, au_id, SUM(royalty) as sum_royalty, advance
	FROM temp_au_tit_royalt_adv
	GROUP BY au_id, title_id

SELECT au_id, SUM(sum_royalty + advance) as profit
	FROM temp_au_tit_sumroyalt_adv
	GROUP BY au_id
	ORDER BY profit DESC
	LIMIT 3

CREATE TABLE most_profiting_authors
	SELECT au_id, SUM(sum_royalty + advance) as profit
		FROM temp_au_tit_sumroyalt_adv
		GROUP BY au_id
		ORDER BY profit DESC
		LIMIT 3