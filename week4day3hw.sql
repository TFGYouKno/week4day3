--1--
SELECT CONCAT(first_name,' ', last_name) AS NAME, city
FROM STAFF 
JOIN address ON staff.address_id = address.address_id
JOIN city ON address.city_id = city.city_id
JOIN country ON city.country_id = country.country_id
WHERE city = 'Texas'

--almost, just need to figure out how to narrow down 'texas'--


--2--



--3--
SELECT customer_id, SUM(amount)
FROM payment
GROUP BY customer_id
HAVING SUM(amount) >=175
ORDER BY SUM(amount) DESC


SELECT first_name, last_name, address_id
FROM customer
WHERE customer_id IN(
    SELECT customer_id
    FROM payment
    GROUP BY customer_id
    HAVING SUM(amount) >=175
    ORDER BY SUM(amount) DESC
)

--needs work--

--4--
SELECT CONCAT(first_name, ' ', last_name) AS NAME
FROM customer
JOIN address ON customer.address_id = address.address_id
JOIN city ON address.city_id = city.city_id
JOIN country ON city.country_id = country.country_id
WHERE country = 'Nepal'

-- 1 customer: Kevin Schuler--

--5--



--6--



--7--



--8--