use sakila;

-- Instructions

-- 1. Get all pairs of actors that worked together.

select * from film_actor; -- actor_id, film_id

select fa1.actor_id, fa1.film_id, fa2.actor_id, fa2.film_id 
from film_actor fa1
join film_actor fa2
on fa1.film_id = fa2.film_id
and fa1.actor_id <> fa2.actor_id
order by fa1.actor_id;


-- 2. Get all pairs of customers that have rented the same film more than 3 times.

select * from rental; -- inventory_id, customer_id
select * from inventory; -- inventory_id, film_id
select * from film; -- film_id

select r1.customer_id, r2.customer_id, title, count(distinct i.film_id) as times_rented
from inventory i
join film f
on i.film_id = f.film_id
join rental r1
on i.inventory_id = r1.inventory_id
join rental r2
on r1.inventory_id = r2.inventory_id
and r1.customer_id < r2.customer_id
group by r1.customer_id, r2.customer_id
having times_rented > 3;


-- 3. Get all possible pairs of actors and films.

select first_name, last_name, title
from actor
cross join film;




