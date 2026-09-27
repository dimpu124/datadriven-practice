WITH daily_errors AS (
    SELECT
        DATE(first_at) AS error_date,
        COUNT(*) AS error_count
    FROM err_tracks
    GROUP BY DATE(first_at)
),
with_previous AS (
    SELECT
        error_date,
        error_count,
        LAG(error_count) OVER (
            ORDER BY error_date
        ) AS prev_count
    FROM daily_errors
)
SELECT
    error_date,
    error_count,
    prev_count,
    error_count - prev_count AS day_over_day_change
FROM with_previous
ORDER BY error_date;
