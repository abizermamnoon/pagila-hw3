/*
 * This question and the next one are inspired by the Bacon Number:
 * https://en.wikipedia.org/wiki/Six_Degrees_of_Kevin_Bacon#Bacon_numbers
 *
 * List all actors with Bacall Number 1.
 * That is, list all actors that have appeared in a film with 'RUSSELL BACALL'.
 * Do not list 'RUSSELL BACALL', since he has a Bacall Number of 0.
 */
-- the plan is to list all the films that Russell Bacall has played in and then list all the actors he has played ini
select actor.first_name || ' ' || actor.last_name as "Actor Name" 
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
select first_name || ' ' || last_name
from actor
where actor.first_name = 'RUSSELL' and actor.last_name = 'BACALL'
order by "Actor Name";
