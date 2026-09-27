select
  distinct 
    nspace,
    pod_name,
    mem_used
from k8s_pods
where mem_used is not null
qualify dense_rank() over (partition by nspace order by mem_used) = 1
order by mem_used;
