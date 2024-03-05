/*
 * Management wants to create a "best sellers" list for each actor.
 *
 * Write a SQL query that:
 * For each actor, reports the three films that the actor starred in that have brought in the most revenue for the company.
 * (The revenue is the sum of all payments associated with that film.)
 *
 * HINT:
 * For correct output, you will have to rank the films for each actor.
 * My solution uses the `rank` window function.
 */
/* link actors to films, find revenue, group by actor, order in desc and ranki */
select a.actor_id, a.first_name, a.last_name, r.film_id, r.title, r.rank, r.revenue
from actor a
join lateral (
    select film_id, title, sum(amount) as revenue, RANK () OVER (
    ORDER BY COALESCE(SUM(amount), 0.00) DESC, title ASC
    ) rank
    from film_actor
    join film using (film_id)
    join inventory using (film_id)
    join rental using (inventory_id)
    join payment using (rental_id)
    where actor_id = a.actor_id
    group by film_id, title
    limit 3

) r on true;
