-- QUESTION IS THE SENIOR MOST EMPLOYEE BASED ON JOB TITTLE ?

use music ;

SELECT 
    *
FROM
    employee
ORDER BY levels DESC
LIMIT 1;

-- QUESTION 2 which country have the most invoice ?
SELECT 
    COUNT(billing_country), billing_country AS counts
FROM
    invoice
GROUP BY billing_country
ORDER BY counts DESC
LIMIT 3;

-- what are top 3 values of total invoice 
SELECT 
    total
FROM
    invoice
ORDER BY total DESC
LIMIT 3;

-- WHICH CITY HAS A BEST COUSTEMER WE WOULD LIKE TO THROUGH A PROMOTIONAL 
-- MUSIC FESTIVAL IN THE CITY WE MADE THE MOST MONEY.WRITE A 
-- QUERY THAT A CITY ONE CITY THAT HAS HIGEST SUM OF INVOICE TOTALS 
-- RETURN BOTH THE CITY NAME & SUM OF ALL INVOICE TOTALS?

SELECT 
    SUM(TOTAL) AS invoice_total, billing_city
FROM
    invoice
GROUP BY billing_city
ORDER BY invoice_total DESC;

-- QUESTION 5 : WHO IS THE BEST CUSTOMER  ? THE CUSTOMER WHO HAS SPENT THE MOST MONEY WILL BE DECLERED THE BEST CUSTOMER
-- WRITE A QUERY  THAT  RETURN THE  PERSON WHO  HAS SPENT THE MOST MONEY .

SELECT 
    customers.customer_id,
    customers.first_name,
    customers.last_name,
    SUM(invoice.total) AS total
FROM
    customers
        JOIN
    invoice ON customers.customer_id = invoice.customer_id
GROUP BY customers.customer_id , customers.first_name , customers.last_name
ORDER BY total DESC
LIMIT 1;

-- write query to returns the email first name last name and genre of all rock music listeners returns your list ordered alphabatically
-- by email starting whith A ?

SELECT DISTINCT
    email, first_name, last_name
FROM
    customers
        JOIN
    invoice ON customers.customer_id = invoice.customer_id
        JOIN
    invoice_line ON invoice.invoice_id = invoice_line.invoice_id
WHERE
    track_id IN (SELECT 
            track_id
        FROM
            track
                JOIN
            genre ON track.genre_id = genre.genre_id
        WHERE
            genre.name LIKE 'Rock') ;
            
           
           
           
--  lets invite the artist who have written the most rock music in our dataset write a query that return the artist name 
-- and total track count to the top 10 rock bands 

SELECT 
    artist.artist_id,
    artist.name,
    COUNT(artist.artist_id) AS number_of_song
FROM
    track
        JOIN
    album2 ON album2.album_id = track.album_id
        JOIN
    artist ON artist.artist_id = album2.artist_id
        JOIN
    genre ON genre.genre_id = track.genre_id
WHERE
    genre.name LIKE 'Rock'
GROUP BY artist.artist_id , artist.name
ORDER BY number_of_song DESC
LIMIT 10; 

-- Return all  the track names that have a song length longer than the average song length return the name
-- and  milliseconds each track order by the song length with the longest song listed  first .


 




