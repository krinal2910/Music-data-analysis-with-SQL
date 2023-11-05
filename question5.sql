-- Q-5 Who is the best customer ? 
--the customer who sepnt most money will be the best customer
select customer.customer_id, customer.first_name, customer.last_name, SUM(invoice.total) as total 
from customer 
JOIN invoice ON customer.customer_id = invoice.customer_id
GROUP BY customer.customer_id
ORDER BY total desc
limit 1