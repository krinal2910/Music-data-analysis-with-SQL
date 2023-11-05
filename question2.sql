--Q-2 which country has the most Invoices?
select COUNT(*) as k, billing_country
from invoice
group by billing_country 
order by k desc 