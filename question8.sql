--Q-8 give all track names that have song length have longer than average song length.
-- Return the name and milliseconds or each track 
--order by the song length with longest song listed first
select name, milliseconds
from track
where milliseconds >(select avg(milliseconds) as avg_track_length
	   from track)
order by milliseconds DESC;
