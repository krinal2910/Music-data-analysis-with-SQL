--Q-9 find how much amount spent by each customer on artists? 
-- Give customer name, artist name and total spent

WITH best_selling_artist AS (
    SELECT artist.artist_id AS artist_id, artist.name AS artist_name,
    SUM(invoice_line.unit_price * invoice_line.quantity) AS total_sales
    FROM invoice_line
    JOIN track ON track.track_id = invoice_line.track_id
    JOIN album ON album.album_id = track.album_id
    JOIN artist ON artist.artist_id = album.artist_id
    GROUP BY 1
    ORDER BY 3 DESC
    LIMIT 1
)

SELECT c.customer_id, c.first_name, c.last_name, bsa.artist_name,
       SUM(invoice_line.unit_price * invoice_line.quantity) AS amount_spent
FROM invoice
JOIN customer c ON c.customer_id = invoice.customer_id
JOIN invoice_line ON invoice_line.invoice_id = invoice.invoice_id
JOIN track ON invoice_line.track_id = track.track_id
JOIN album ON track.album_id = album.album_id
JOIN best_selling_artist bsa ON album.artist_id = bsa.artist_id
GROUP BY 1, 2, 3, 4
ORDER BY amount_spent DESC;

	
	