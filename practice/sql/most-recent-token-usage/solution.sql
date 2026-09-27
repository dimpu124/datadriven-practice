select * from (
select 
token_id,
owner_id,
scope,
status,
issued,
expires,
last_used,
requests,
dense_rank() over (partition by owner_id order by last_used desc) latest
from api_tokens
)
 where latest = 1
