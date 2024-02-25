# Capstone Project - L1 C8 - sakila
use sakila;

# task - 1 Full name of the actors
select concat(first_name," ",last_name) as full_name from actor;

# task - 2a Count of first name of acotrs
select first_name,count(first_name) from actor group by first_name;

# task - 2b Unique first name actors
select first_name,count(first_name) from actor group by first_name having count(first_name) = 1;

# task - 3a Count of last name of acotrs
select last_name,count(last_name) from actor group by last_name;

# task - 3b Unique last name actors
select last_name,count(last_name) from actor group by last_name having count(last_name) = 1;

# task - 4a R rated movies
select * from film where rating = "R";

# task - 4b Not R rated movies
select * from film where rating != "R";

# task - 4c Under 13 age movies
select * from film where rating = "PG-13";

# task - 5a Movies with replacement_cost upto 11
select * from film where replacement_cost <= 11;

# task - 5b Movies with replacement_cost between 11 and 20
select * from film where replacement_cost between 11 and 20;

# task - 5c Decreasing order of movies by replacement_cost
select * from film order by replacement_cost desc;

# task - 6 Movies with high number of actors
select title, count(actor_id) as Number_of_actors from film join film_actor using (film_id) group by title order by count(actor_id) desc limit 3;

# task - 7 Movies starts with K and Q
select title from film where title like "K%" or title like "Q%";

# task - 8 Actors of AGENT TRUMAN movie
select first_name, last_name from actor join film_actor using (actor_id) 
join film using (film_id)
where film_id = (select film_id from film where title = "AGENT TRUMAN");

# task - 9 Family movies
select title from film join film_category using (film_id) 
join category using (category_id) where name = "Family";

# task - 10a Descending order of average rental rates
select rating, max(rental_rate), min(rental_rate), avg(rental_rate) from film group by rating order by avg(rental_rate) desc;

# task - 10b Descending order of rental frequencies
select title,count(inventory_id) from film join inventory using (film_id) 
join rental using (inventory_id) group by inventory_id order by count(inventory_id) desc;

# task - 11 Film categories with difference of average of replacement_cost - average of rental_rate
select name,avg(replacement_cost)- avg(rental_rate) from film_category join film using (film_id) 
join category using (category_id) group by name having avg(replacement_cost) - avg(rental_rate) > 15;

# task - 12 Film categories with 70+ movies 
select name,count(film_id) from film join film_category using (film_id)
join category using (category_id) group by name having count(film_id) > 70 order by count(film_id);

# task - 13 Movie category with total sale amounts
select name, sum(amount) as total_sale_amount from film 
join film_category using (film_id)
join category using (category_id)
join inventory using (film_id)
join rental using (inventory_id)
join payment using (rental_id) group by name order by total_sale_amount;

# task - 14 Actors with best rating
select first_name, last_name from actor 
join film_actor using (actor_id) 
join film using (film_id)
where rating = (select max(rating) from film) limit 3;

# task - 15 Action movies with high length of screen time
select title,length from film join film_category using (film_id) 
join category using (category_id) where name = "Action" order by length desc;


