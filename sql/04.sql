/*
 * List the first and last names of all actors who:
 * 1. have appeared in at least one movie in the "Children" category,
 * 2. but that have never appeared in any movie in the "Horror" category.
 */
SELECT  distinct first_name, last_name 
from actor
join film_actor using (actor_id)
join film on film_actor.film_id = film.film_id
join film_category on film.film_id = film_category.film_id
join category using (category_id)
where actor.actor_id in
(select actor.actor_id
    from actor
    join film_actor using (actor_id)
join film on film_actor.film_id = film.film_id
join film_category on film.film_id = film_category.film_id
join category using (category_id)
where name = 'Children'
)
and actor.actor_id not in
(select actor.actor_id
    from actor
    join film_actor using (actor_id)
join film on film_actor.film_id = film.film_id                  join film_category on film.film_id = film_category.film_id
join category using (category_id)
where name = 'Horror'
)
order by last_name;


