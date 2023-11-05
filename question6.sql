-- Q-6 give the email, first name , last name, and genre of all Rock music listners. 
--Return the list orderd alphabetically by email starting with 'A' 
select DISTINCT email, first_name, last_name
from customer
JOIN invoice ON customer.customer_id = invoice.customer_id
JOIN invoice_line ON invoice.invoice_id = invoice_line.invoice_id
WHERE track_id IN(
	select track_id from track 
	JOIN genre ON track.genre_id = genre.genre_id 
	WHERE genre.name LIKE 'Rock'
)
ORDER BY email;