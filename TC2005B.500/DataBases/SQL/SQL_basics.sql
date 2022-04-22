									/*==== SQL BASICS ====*/
USE sakila;
/*DESC actor;*/
									/*SELECT CLAUSE*/
/*select * from language;*/
/*SELECT * FROM city;*/
		/* '*' = 'wildcard'*/
		/* Name of table as name of row:*/
/*select city from city;*/
/*select city from sakila.city;*/
/*select city, city from sakila.city;*/
		/*WHERE -> Allows for a select to filter results given a condition*/
/*SELECT * FROM sakila.language WHERE name = 'Italian';*/
/*SELECT first_name from sakila.actor where actor_id = 2;*/
/*select city from city where country_id = 15;*/
		/*'<>' = '!=' (BOTH CAN BE USED INTERCHANGEABLY (<> is the standard).*/
/*select language_id, name from language where language_id <> 2 && language_id <> 3;*/
/*select first_name from actor where first_name  > 'D' && first_name < 'G';*/
/*select title from film where title like '%family%';*/
		/*LIKE matching should be used for strings*/
        /*Using order and limit one can transform how the output is returned*/
select name from customer_list order by name limit 20;
        