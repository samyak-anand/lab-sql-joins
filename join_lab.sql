/*
Write SQL queries to perform the following tasks using the Sakila database:

List the number of films per category.
Retrieve the store ID, city, and country for each store.
Calculate the total revenue generated by each store in dollars.
Determine the average running time of films for each category.
*/


#use database sakila
use sakila; 

#List the number of films per category.
select c.name , count(c.name) as count
from film f  
inner join film_category fc on f.film_id= fc.film_id
inner join category c on c.category_id= fc.category_id
group by(c.name);

# Retrieve the store ID, city, and country for each store.

select s.store_id, c.city,cc.country
from 
address a inner join city c on a.city_id=c.city_id
inner join country cc on c.country_id = cc.country_id
inner join store s on a.address_id= s.address_id;


#Calculate the total revenue generated by each store in dollars.

select s.store_id, sum(p.amount)
from 
customer c inner join store s  on c.store_id= s.store_id 
inner join payment p on c.customer_id= p.customer_id
group by (s.store_id);

#Determine the average running time of films for each category.
select c.name, avg(f.length) as avg_running_time
from film f  
inner join film_category fc on f.film_id= fc.film_id
inner join category c on c.category_id= fc.category_id
group by(c.name);

/*
Identify the film categories with the longest average running time.
Display the top 10 most frequently rented movies in descending order.
Determine if "Academy Dinosaur" can be rented from Store 1.
Provide a list of all distinct film titles, along with their availability status in the inventory. 
Include a column indicating whether each title is 'Available' or 'NOT available.' Note that there are 42 titles that are not in the inventory, 
and this information can be obtained using a CASE statement combined with IFNULL."
*/

#Identify the film categories with the longest average running time
select c.name, avg(f.length) as avg_running_time
from film f  
inner join film_category fc on f.film_id= fc.film_id
inner join category c on c.category_id= fc.category_id
group by(c.name)
order by avg_running_time DESC;

#Display the top 10 most frequently rented movies in descending order.


#select * from rental
