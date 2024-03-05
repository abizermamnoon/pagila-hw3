/*
 * Compute the country with the most customers in it. 
 */
select country --, count(customer_id)
from customer
join address using (address_id)
join city using (city_id)
join country using (country_id)
group by country
order by count(customer_id) desc
limit 1;
