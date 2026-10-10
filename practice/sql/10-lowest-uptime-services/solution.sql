SELECT svc_name, min_uptime
FROM (
    SELECT svc_name,
           MIN(uptime) AS min_uptime,
           RANK() OVER (ORDER BY MIN(uptime) ASC) AS rnk
    FROM svc_health
    WHERE uptime IS NOT NULL
    GROUP BY svc_name
) t
WHERE rnk <= 10
ORDER BY min_uptime ASC, svc_name;
