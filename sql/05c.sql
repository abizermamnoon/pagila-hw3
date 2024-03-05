/* 
 * You also like the acting in the movies ACADEMY DINOSAUR and AGENT TRUMP,
 * and so you'd like to see movies with actors that were in either of these movies or AMERICAN CIRCUS.
 *
 * Write a SQL query that lists all movies where at least 3 actors were in one of the above three movies.
 * (The actors do not necessarily have to all be in the same movie, and you do not necessarily need one actor from each movie.)
 */
select f2.title --, count(f2.title)
from film f1
join film_actor fal on (f1.film_id = fal.film_id)
join actor a1 on (fal.actor_id = a1.actor_id)
join film_actor fa2 on (a1.actor_id = fa2.actor_id)
join film f2 on (f2.film_id = fa2.film_id)
where f1.title in ('AMERICAN CIRCUS', 'ACADEMY DINOSAUR', 'AGENT TRUMAN')
group by f2.title
having count(f2.title) >= 3
order by f2.title
