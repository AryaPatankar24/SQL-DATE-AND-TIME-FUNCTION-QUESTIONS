USE sakila;

#31. List all rental transactions that occurred in the last 30 days.

SELECT * FROM rental 
WHERE rental_date >= date_sub(curdate(), interval 30 day);

#32. Find the most recent rental transaction in the database.

SELECT * FROM rental
ORDER BY rental_date DESC
LIMIT 1;

#33. Show the total number of rentals for each month in 2005.

SELECT MONTH(rental_date) AS month,
COUNT(rental_id) AS total_rental
FROM rental 
WHERE YEAR(rental_date) = 2005
GROUP BY month
ORDER BY month;

#34. Calculate the total number of days each film has been rented.

SELECT f.film_id, f.title,
SUM(DATEDIFF(r.return_date, r.rental_date)) AS total_rented_days
FROM rental r
JOIN inventory i ON i.inventory_id = r.inventory_id
JOIN film f ON f.film_id = i.film_id
WHERE r.rental_date IS NOT NULL 
GROUP BY f.film_id, f.title
ORDER BY total_rented_days DESC;

#35. Retrieve all customers who registered after January 1, 2006.

SELECT customer_id, first_name, last_name, create_date
FROM customer
WHERE create_date > '2006-01-01' 
ORDER BY create_date;

#36. Retrieve the film titles along with the names of customers who rented them and the rental dates.

