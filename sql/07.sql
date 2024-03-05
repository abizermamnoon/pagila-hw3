/*
 * List all actors with Bacall Number 2;
 * That is, list all actors that have appeared in a film with an actor that has appeared in a film with 'RUSSELL BACALL',
 * but do not include actors that have Bacall Number < 2.
 */
/* first find all films that the following actors worked in then find all actors who worked with them and use the except to remove them */
select actor.first_name || ' ' || actor.last_name as "Actor Name"
from actor
where actor.actor_id in (
select actor.actor_id --, actor.first_name || ' ' || actor.last_name as "Actor Name"
from actor
join film_actor using (actor_id)
join film using (film_id)
where title in (
select title 
from film
join film_actor on film.film_id = film_actor.film_id
join actor on film_actor.actor_id = actor.actor_id
where actor.actor_id in (
select actor.actor_id 
from actor
join film_actor using (actor_id)
join film using (film_id)
where title in (
select title
from film
join film_actor on film.film_id = film_actor.film_id
join actor on film_actor.actor_id = actor.actor_id
where actor.first_name = 'RUSSELL' and actor.last_name = 'BACALL'
)
except
select actor.actor_id 
from actor
where actor.first_name = 'RUSSELL' and actor.last_name = 'BACALL'
)
)
except (
select actor.actor_id 
from actor
join film_actor using (actor_id)
join film using (film_id)
where title in (
select title
from film
join film_actor on film.film_id = film_actor.film_id
join actor on film_actor.actor_id = actor.actor_id
where actor.first_name = 'RUSSELL' and actor.last_name = 'BACALL'
)
except
select actor.actor_id 
from actor
where actor.first_name = 'RUSSELL' and actor.last_name = 'BACALL'
)
except
select actor.actor_id 
from actor
where actor.first_name = 'RUSSELL' and actor.last_name = 'BACALL'

)
order by "Actor Name";
