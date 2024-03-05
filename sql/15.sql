/*
 * Find every documentary film that is rated PG.
 * Report the title and the actors.
 *
 * HINT:
 * Getting the formatting right on this query can be tricky.
 * You are welcome to try to manually get the correct formatting.
 * But there is also a view in the database that contains the correct formatting,
 * and you can SELECT from that VIEW instead of constructing the entire query manually.
 */
/* select documentary films that are rated PG and then select titles and actors in these films */
select title, STRING_AGG(
        UPPER(SUBSTRING(first_name FROM 1 FOR 1)) || LOWER(SUBSTRING(first_name FROM 2)) || 

        UPPER(SUBSTRING(last_name FROM 1 FOR 1)) || LOWER(SUBSTRING(last_name FROM 2)), ', '
    ) AS actors
from (
select a.actor_id, a.first_name, a.last_name, r.title, r.film_id, r.rating
from actor a
join lateral (
    select film_id, title, rating
    from film_actor
    join film using (film_id)
    join film_category using (film_id)
    join category using (category_id)
    where actor_id = a.actor_id
    and rating = 'G' and name = 'Documentary'

) r on true
) as t
group by title
order by title;
