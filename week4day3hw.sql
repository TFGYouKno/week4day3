-- for some reason, i wasn't able to copy and paste the questions
--from the homework file. Sorry bub

--1--
SELECT CONCAT (first_name,' ' ,last_name) AS Name, district
FROM customer 
JOIN address
ON customer.address_id = address.address_id 
WHERE district = 'Texas';

--5 customers--


--2--
SELECT CONCAT (first_name,' ' ,last_name) AS full_name, amount
FROM customer 
JOIN payment  
ON customer.customer_id  = payment.customer_id  
WHERE amount > 6.99;

--1,423 transactions

--3--
SELECT first_name, last_name
FROM customer
WHERE customer_id IN (
	SELECT customer_id
	FROM payment
	GROUP BY customer_id 
	HAVING SUM (amount) > 175
	ORDER BY SUM (amount) DESC
)
-- 7 transactions

--4--
SELECT CONCAT(first_name, ' ', last_name) AS NAME
FROM customer
JOIN address ON customer.address_id = address.address_id
JOIN city ON address.city_id = city.city_id
JOIN country ON city.country_id = country.country_id
WHERE country = 'Nepal'

-- 1 customer: Kevin Schuler--

--5--
SELECT CONCAT(first_name,' ' ,last_name) AS full_name, COUNT(amount) AS total_transactions
FROM staff
JOIN payment
ON staff.staff_id = payment.staff_id 
GROUP BY full_name
ORDER BY COUNT(amount) DESC 

--jon stephens with 7,304 transactions

--6--
SELECT rating, count(rating) AS total_movies_for_rating 
FROM film
GROUP BY rating
-- G: 178, PG: 194, PG13: 223, R: 195, NC17:210 (are there even that many NC17 movies in existance?!?)

--7--
SELECT CONCAT(first_name,' ' ,last_name) AS full_name
FROM customer
WHERE customer_id IN (
	SELECT customer_id 
	FROM payment
	GROUP BY customer_id 
	HAVING SUM (amount) > 6.99
	ORDER BY SUM (amount) DESC
)
-- 599 people who spent over $6.99

--8--
SELECT count(rental_id) AS total_free_rentals_given 
FROM rental
WHERE rental_id  IN (
	SELECT rental_id
	FROM payment
	GROUP BY rental_id 
	HAVING SUM (amount) = 0
)
--24 free rentals given away