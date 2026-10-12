select 'inner_join' join_type, count(*) row_count from users u
join ad_impressions a on u.user_id = a.user_id
union all
select 'left_join' join_type, count(u.user_id) row_count from users u
left join ad_impressions a on u.user_id = a.user_id
union all
select 'full_outer_join' join_type, count(*) row_count from users u
full outer join ad_impressions a on u.user_id = a.user_id
