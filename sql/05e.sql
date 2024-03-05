/* 
 * You've decided that you don't actually like ACADEMY DINOSAUR and AGENT TRUMAN,
 * and want to focus on more movies that are similar to AMERICAN CIRCUS.
 * This time, however, you don't want to focus only on movies with similar actors.
 * You want to consider instead movies that have similar categories.
 *
 * Write a SQL query that lists all of the movies that share 2 categories with AMERICAN CIRCUS.
 * Order the results alphabetically.
 *
 * NOTE:
 * Recall that the following query lists the categories for the movie AMERICAN CIRCUS:
 * ```
 * SELECT name
 * FROM category
 * JOIN film_category USING (category_id)
 * JOIN film USING (film_id)
 * WHERE title = 'AMERICAN CIRCUS';
 * ```
 * This problem should be solved by a self join on the "film_category" table.
 */
/*
select f.title, count(f2.title) --, c1.name
from film f1
join film_category flc on (f1.film_id = flc.film_id)
join category c1 on (flc.category_id = c1.category_id)
join film_category flc2 on (c1.category_id = flc2.category_id)
join film f2 on (f2.film_id = flc2.film_id)
where c1.name in (
    SELECT distinct name
    FROM category
    JOIN film_category USING (category_id)
    JOIN film USING (film_id)
    WHERE title = 'AMERICAN CIRCUS'
)
group by f2.title
having count(f2.title) = 2
order by f2.title;
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
order by f1.title;

