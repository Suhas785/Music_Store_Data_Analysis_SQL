1. Who is the senior most employee based on job title?
select * from employee
order by levels desc 
limit 1

2. Which countries have the most Invoices?
select count(*) as c, billing_country
from invoice 
group by billing_country
order by c desc

3. What are the top 3 values of total invoice 
select total from invoice
order by total desc
limit 3

4. Which city has the best customers? we would like to throw a promotional music festival in the city 
   we made the most money. Write a query that returns one city that has the highest sum of invoice totals.
   return both the city name and sum of all invoice totals
select sum(total) as invoice_total, billing_city
from invoice
group by billing_city
order by invoice_total desc
limit 1


5. Who is the best customer? 
   The customer who has spent the most money will be declared the best customer. 
   Write a query that returns the person who has spent the most money.

select customer.customer_id, first_name, last_name, sum(invoice.total) as total
from customer
join invoice on customer.customer_id = invoice.customer_id
group by customer.customer_id
order by total desc
limit 1


6. Write query to return the email,
   first name, last name, genre of all Rock music listeners. 
   Return your list ordered alphabetically by email starting with A

select distinct email,first_name,last_name
from customer
join invoice on customer.customer_id = invoice.customer_id
join invoice_line on invoice.invoice_id = invoice_line.invoice_id
where track_id in(
      select track_id from track
	  join genre on track.genre_id = genre.genre_id
	  where genre.name like 'Rock'
)
order by email

7.Let's invite the artists who have written the most rock music in our dataset.
  write a query that returns the artist name and total track count of the top 10 rock bands.

select artist.artist_id, artist.name, count(artist.artist_id) as number_of_songs
from track
join album on album.album_id = track.album_id
join artist on artist.artist_id = album.artist_id
join genre on genre.genre_id = track.genre_id
where genre.name like 'Rock'
group by artist.artist_id
order by number_of_songs desc
limit 10


8. Return all the track names that have a song length longer than the average song length. 
   Return the name and millisecnds for each track.
   order by the song lenght with the longest songs listed first

select name,milliseconds 
from track
where milliseconds > (
   select avg(milliseconds) as avg_track_length
   from track)
order by milliseconds desc

9.Find how much amount spent by each customer on artists? 
  write a query to return customre name, artist name and total spent


