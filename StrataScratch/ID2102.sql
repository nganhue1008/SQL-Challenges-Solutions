/* For each video, find how many unique users flagged it. A unique user can be identified using the combination of their first name and last name. Do not consider rows in which there is no flag ID.
user_flags

user_firstname:text
user_lastname:text
video_id:text
flag_id:text
*/
select video_id, count(distinct concat_ws(user_firstname, '',user_lastname)) as count_fullname
from user_flags
where flag_id is not null
group by video_id