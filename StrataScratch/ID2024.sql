/* Write a query that returns the number of unique users per client per month
https://platform.stratascratch.com/coding/2024-unique-users-per-client-per-month?code_type=3
table fact_events
id:
bigint
time_id:
datetime
user_id:
text
customer_id:
text
client_id:
text
event_type:
text
event_id:
bigint
*/ 
select 
    client_id,
    month(time_id) as month,
    count(distinct user_id) as Number_of_Users
from fact_events
group by client_id, month(time_id)