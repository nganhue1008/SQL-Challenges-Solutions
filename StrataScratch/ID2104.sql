/* Which user flagged the most distinct videos that ended up approved by YouTube? Output, in one column, their full name or names in case of a tie. In the user's full name, include a space between the first and the last name.
user_flags

user_firstname:text
user_lastname:text
video_id:text
flag_id:text

flag_review
flag_id:text
reviewed_by_yt:tinyint
reviewed_date:datetime
reviewed_outcome:text
*/

with approved_flags as (
    select 
        uf.user_firstname,
        uf.user_lastname,
        uf.video_id
    from 
        user_flags uf
    join 
        flag_review fr
    on 
        uf.flag_id = fr.flag_id
    where 
        fr.reviewed_by_yt = true
        and fr.reviewed_outcome = 'approved'
),
user_video_counts as (
    select 
        user_firstname,
        user_lastname,
        count(distinct video_id) as distinct_video_count
    from 
        approved_flags
    group by 
        user_firstname, 
        user_lastname
),
max_video_count as (
    select 
        max(distinct_video_count) as max_count
    from 
        user_video_counts
)
select 
    concat(user_firstname, ' ', user_lastname) as full_name
from 
    user_video_counts
where 
    distinct_video_count = (select max_count from max_video_count);
