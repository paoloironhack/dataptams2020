-- Challenge 1
  SELECT a.au_id, a.au_lname, a.au_fname, t.title, p.pub_name
    FROM authors a
    JOIN titleauthor on titleauthor.au_id = a.au_id
    JOIN titles t on t.title_id = titleauthor.title_id
    JOIN publishers p on p.pub_id = t.pub_id

-- Challenge 2
  SELECT a.au_id, a.au_lname, a.au_fname, p.pub_name, COUNT(*)
    FROM authors a
    JOIN titleauthor on titleauthor.au_id = a.au_id
    JOIN titles t on t.title_id = titleauthor.title_id
    JOIN publishers p on p.pub_id = t.pub_id
    GROUP BY a.au_id
-- Challenge 3
  SELECT a.au_id, a.au_lname, a.au_fname, SUM(s.qty) as TOTAL
    FROM authors a
    JOIN titleauthor on titleauthor.au_id = a.au_id
    JOIN titles t on t.title_id = titleauthor.title_id
    JOIN sales s on s.title_id = t.title_id
    GROUP BY a.au_id
    ORDER BY qty DESC
    LIMIT 3
-- Challenge 4
  SELECT a.au_id, a.au_lname, a.au_fname, IFNULL(SUM(s.qty), 0) as qty
    FROM authors a
    LEFT JOIN titleauthor on titleauthor.au_id = a.au_id
    LEFT JOIN titles t on t.title_id = titleauthor.title_id
    LEFT JOIN sales s on s.title_id = t.title_id
    GROUP BY a.au_id
    ORDER BY qty DESC
