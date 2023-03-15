use sakila;

# 1.List the number of films per category.
select category.name as category_name, count(film.film_id) as total_films
from film
join film_category on film_category.film_id=film.film_id
join category on category.category_id=film_category.category_id
group by category.name;

# 2. Display the first and the last names, as well as the address, of each staff member.
select staff.first_name ,staff.last_name,address.address
from staff
join address on staff.address_id = address.address_id;

# 3.Display the total amount rung up by each staff member in August 2005.
select staff.first_name,staff.last_name,staff.staff_id,count(payment.amount) as total_amount
from staff
join payment on payment.staff_id=staff.staff_id
where payment.payment_date like '2005-08-%'
group by staff.staff_id
order by total_amount desc;

# 4.List all films and the number of actors who are listed for each film.
select count(film_actor.actor_id) as total_count,film.title
from film
join film_actor on film_actor.film_id=film.film_id
group by film.title
order by total_count desc;

# 5. Using the payment and the customer tables as well as the JOIN command, list the total amount paid by each customer. 
# List the customers alphabetically by their last names.

select count(payment.amount) as total_paid,customer.first_name,customer.last_name,customer.customer_id
from customer
join payment on payment.customer_id=customer.customer_id
group by customer_id
order by customer.last_name;