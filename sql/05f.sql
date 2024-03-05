/* 
 * Finding movies with similar categories still gives you too many options.
 *
 * Write a SQL query that lists all movies that share 2 categories with AMERICAN CIRCUS and 1 actor.
 *
 * HINT:
 * It's possible to complete this problem both with and without set operations,
 * but I find the version using set operations much more intuitive.
 */
select f1.title --, count(f1.title) --, c2.name
from category c1
join film_category flc on (c1.category_id = flc.category_id)
join film f1 on (flc.film_id = f1.film_id)
--join film_category flc2 on (f1.film_id = flc2.category_id)
--join category c2 on (flc2.category_id = c2.category_id)
where c1.name in (
    SELECT name
    FROM category
    JOIN film_category USING (category_id)
    JOIN film USING (film_id)
    WHERE title = 'AMERICAN CIRCUS'
)
group by f1.title
having count(f1.title) >= 2
intersect
select f2.title --, count(f2.title)
from film f1
join film_actor fal on (f1.film_id = fal.film_id)
join actor a1 on (fal.actor_id = a1.actor_id)
join film_actor fa2 on (a1.actor_id = fa2.actor_id)
join film f2 on (f2.film_id = fa2.film_id)
where f1.title in ('AMERICAN CIRCUS')
group by f2.title
having count(f2.title) >= 1
order by title
