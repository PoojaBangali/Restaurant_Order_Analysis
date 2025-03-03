-- 1. Combine menu_items and order_details tables into a single table
select * from menu_items; -- Lookup table
select * from order_details; -- transaction table

select  * 
from    order_details od LEFT JOIN menu_items mi
			on od.item_id = mi.menu_item_id; -- We want every transaction details thats why 
-- apply Left join on order_details table
            

-- 2.What were the least and most ordered items? What categories were they in?
select  item_name, count(order_details_id) as num_items 
from    order_details od LEFT JOIN menu_items mi
			on od.item_id = mi.menu_item_id
Group By item_name
order By num_items;

select  item_name, count(order_details_id) as num_items 
from    order_details od LEFT JOIN menu_items mi
			on od.item_id = mi.menu_item_id
Group By item_name
order By num_items DESC;

select  item_name, category, count(order_details_id) as num_items 
from    order_details od LEFT JOIN menu_items mi
			on od.item_id = mi.menu_item_id
Group By item_name, category
order By num_items DESC;

-- 3.What were the top 5 orders that spent the most money
select  order_id, SUM(price) as total_spend
from    order_details od LEFT JOIN menu_items mi
			on od.item_id = mi.menu_item_id
Group by order_id
order by total_spend DESC
LIMIT 5;

-- 4.View the details of highest spend order. What insights can you gather from the results? 
select  category, count(item_id) as num_items
from    order_details od LEFT JOIN menu_items mi
			on od.item_id = mi.menu_item_id
where order_id = 440
Group by category;


-- 5.View the details of top 5 highest spend orders. What insights can you gather from the results?
select  category, count(item_id) as num_items
from    order_details od LEFT JOIN menu_items mi
			on od.item_id = mi.menu_item_id
where order_id IN (440,2075,1957,330,2675)
Group by category;

/*440	192.15
2075	191.05
1957	190.10
330	189.70
2675	185.10*/
