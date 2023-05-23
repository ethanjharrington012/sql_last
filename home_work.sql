-- question 1

SELECT customer.customer_id, customer.first_name
FROM customer
JOIN address ON customer.address_id = address.address_id
WHERE address.district = 'Texas';


-- question 2
SELECT customer.customer_id, customer.first_name, payment.amount
FROM customer
JOIN payment ON customer.customer_id = payment.customer_id
WHERE payment.amount > 6.99;


-- question 3
SELECT first_name
FROM customer
WHERE customer_id IN (
    SELECT customer_id
    FROM payment
    WHERE amount > 175
);


-- question 4

SELECT customer.customer_id, customer.first_name
FROM customer
JOIN city ON customer.address_id = city.city_id
WHERE city.country = 'Nepal';


-- question 5

SELECT staff.staff_id, staff.first_name, staff.last_name, COUNT(*) AS transaction_count
FROM staff
JOIN payment ON staff.staff_id = payment.staff_id
GROUP BY staff.staff_id, staff.first_name, staff.last_name
ORDER BY transaction_count DESC
LIMIT 1;

-- question 6

SELECT rating, COUNT(*) AS film_count
FROM film
GROUP BY rating;

-- question 7
SELECT customer_id, first_name
FROM customer
WHERE customer_id IN (
    SELECT customer_id
    FROM payment
    WHERE amount > 6.99
    GROUP BY customer_id
    HAVING COUNT(*) = 1
);

-- question 8
SELECT COUNT(*) AS free_rental_count
FROM rental
LEFT JOIN payment ON rental.rental_id = payment.rental_id
WHERE payment.rental_id IS NULL;





