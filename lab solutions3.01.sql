USE sakila;

-- 1. Drop column picture from staff.

ALTER TABLE sakila.staff
DROP COLUMN picture;

-- 2. A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly.

SELECT * from staff
WHERE first_name= 'Jon';

SELECT * from customer
WHERE first_name= 'TAMMY' AND last_name='SANDERS';

INSERT INTO staff(first_name, last_name, address_id, email, store_id, active, username, last_update)
VALUES
('Tammy', 'Sanders',  79, 'Tammy.Sanders@sakilastaff.com', 2, 1,'Tammy' , '2006-02-15 04:57:20');

DELETE FROM payment
WHERE customer_id = 75;
DELETE FROM rental
WHERE customer_id = 75;
DELETE FROM customer
WHERE customer_id = 75;

/* 3. Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1.
You can use current date for the rental_date column in the rental table.
Hint: Check the columns in the table rental and see what information you would need to add there.
You can query those pieces of information. For eg., you would notice that you need customer_id information as well.
To get that you can use the following query:

select customer_id from sakila.customer
where first_name = 'CHARLOTTE' and last_name = 'HUNTER';

Use similar method to get inventory_id, film_id, and staff_id.
*/

select customer_id from sakila.customer
where first_name = 'CHARLOTTE' and last_name = 'HUNTER';

select staff_id from sakila.staff
where first_name = 'Mike' and last_name = 'Hillyer';

select inventory_id, store_id from sakila.inventory
	where film_id IN (
		select film_id from sakila.film
        where title = 'Academy Dinosaur');
        
INSERT INTO rental(rental_date, inventory_id, customer_id, return_date, staff_id)
VALUES
('2007-10-17 16:47:23', 3, 130, '2007-10-27 12:14:55', 1)