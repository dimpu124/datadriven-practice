select * from (
select endpoint,endpoint_count,dense_rank() over (order by endpoint_count) rk 
from
    (
select endpoint,count(user_id) endpoint_count from api_calls
where lower(method) = 'post'
group by endpoint
)
) where rk < 4
