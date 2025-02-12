/* Find out how many premium accounts that are paid on any given day are still premium and paid 7 days later.
https://platform.stratascratch.com/coding/2097-premium-acounts?code_type=3
premium_accounts_by_day
account_id: text
entry_date: datetime
users_visited_7d: bigint
final_price: bigint
plan_size: bigint
*/

select p1.entry_date,
    count(p1.account_id) as premium_paid_accounts,
    count(distinct p2.account_id) as premium_paid_accounts_after_7d
from premium_accounts_by_day p1
left join premium_accounts_by_day p2 on p1.account_id = p2.account_id
    and datediff (p2.entry_date, p1.entry_date) = 7
    and p2.final_price > 0
where p1.final_price > 0
group by p1.entry_date
order by p1.entry_date
limit 7
