use restaurant_db;
-- 1.View The Menu items table
select * from menu_items;

-- 2.Find the number of items on the menu
select count(*) from menu_items;

-- 3.What are the least and most expensive items on the menu
select * from menu_items
order by price;

select * from menu_items
order by price DESC;

-- 4.How many Italian dishes are on the menu
Select count(*) from menu_items
where category = 'Italian';

-- 5.What are the least and most expensive Italian dishes are on the menu 
Select * from menu_items
where category = 'Italian'
order by price;

Select   * 
from     menu_items
where    category = 'Italian'
order by price DESC;

-- 6.How many dishes are in each category
select   category,count(menu_item_id) as num_dishes
from     menu_items
group by category;

-- 7.What is the average dish price within each category
select   category,avg(price) as avg_price
from     menu_items
group by category;


