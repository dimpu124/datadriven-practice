WITH calls_with_previous AS (
    SELECT
        user_id,
        endpoint,
        status,
        call_time,
        LAG(call_time) OVER (
            PARTITION BY user_id, endpoint
            ORDER BY call_time
        ) AS previous_call_time
    FROM api_calls
),
retries AS (
    SELECT
        user_id,
        endpoint
    FROM calls_with_previous
    WHERE status >= 400
      AND previous_call_time IS NOT NULL
      AND call_time <= previous_call_time + INTERVAL '5 minutes'
)
SELECT
    user_id,
    endpoint,
    COUNT(*) AS retry_count
FROM retries
GROUP BY user_id, endpoint
ORDER BY retry_count DESC, user_id, endpoint;
