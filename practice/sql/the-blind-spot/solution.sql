WITH members AS (
    SELECT DISTINCT channel, sender_id AS user_id
    FROM chat_msgs
    WHERE sender_id IS NOT NULL
),
connections AS (
    SELECT DISTINCT a.user_id, b.user_id AS conn_id
    FROM members a
    JOIN members b
      ON a.channel = b.channel
     AND a.user_id <> b.user_id
),
viewed AS (
    SELECT DISTINCT user_id, page_url
    FROM page_views
    WHERE user_id IS NOT NULL
),
candidates AS (
    SELECT c.user_id, v.page_url
    FROM connections c
    JOIN viewed v
      ON v.user_id = c.conn_id
    GROUP BY c.user_id, v.page_url
    HAVING COUNT(*) >= 2
)
SELECT cand.user_id, cand.page_url AS content_id
FROM candidates cand
WHERE NOT EXISTS (
    SELECT 1
    FROM viewed v
    WHERE v.user_id  = cand.user_id
      AND v.page_url = cand.page_url
)
ORDER BY cand.user_id, content_id;
