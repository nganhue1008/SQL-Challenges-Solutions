/* Write a query that will calculate the number of shipments per month
amazon_shipment
shipment_id:bigint
sub_id:bigint
weight:bigint
shipment_date:datetime
*/
select 
    count(shipment_id),
    date_format(shipment_date, "%Y-%m") as time
from amazon_shipment
group by time
