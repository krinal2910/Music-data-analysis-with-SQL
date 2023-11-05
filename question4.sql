-- Q-4 Which city has the best customers ? 
--If wanted to throw music festival in he city that has the highest sum of invoice totals
--Return both the city name and invoice total
select SUM(total) as invoice_total, billing_city
from invoice
group by billing_city
order by invoice_total desc