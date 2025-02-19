/* You have been asked to find the 5 most lucrative products in terms of total revenue for the first half of 2022 (from January to June inclusive).
online_orders

product_id:bigint
promotion_id:bigint
cost_in_dollars:bigint
customer_id:bigint
date_sold:datetime
units_sold:bigint
date:datetime

*/ 
select 
    product_id,
    sum(cost_in_dollars * units_sold) as total
from online_orders
where 
    month(date) between 01 and 06
group by product_id
order by total desc
limit 5