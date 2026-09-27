SELECT
    job_name,
    rows_done
FROM (
    SELECT
        job_name,
        rows_done,
        ROW_NUMBER() OVER (
            PARTITION BY job_name
            ORDER BY started
        ) AS rn
    FROM batch_jobs
) t
WHERE rn = 1
ORDER BY job_name;
