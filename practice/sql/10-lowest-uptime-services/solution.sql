select svc_name, min_uptime from (
select svc_name, min(COALESCE(uptime,0)) min_uptime,dense_rank() over ( order by min(COALESCE(uptime,0))) rk from svc_health 
where uptime is not null
group by svc_name 
) where rk < 11
order by min_uptime, svc_name
