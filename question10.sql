-- Q-10 Find most popular music genre for each country. 
--the most popular genre as the genre with the highest amount of purhases 
-- Give each country along with the top genre. For countries where maximum number of purchases is shared return all genres.

WITH popular_genre AS (
SELECT COUNT(invoice_line.quantity) AS purchases, 
	   customer.country, 
	   genre.name, 
	   ROW_NUMBER() OVER (PARTITION BY customer.country ORDER BY COUNT(invoice_line.quantity) DESC) AS RowNo
    FROM invoice_line
    JOIN invoice ON invoice.invoice_id = invoice_line.invoice_id
    JOIN customer ON customer.customer_id = invoice.customer_id
    JOIN track ON track.track_id = invoice_line.track_id
    JOIN genre ON genre.genre_id = track.genre_id
    GROUP BY customer.country, genre.name
)

SELECT * FROM popular_genre WHERE RowNo = 1;

	