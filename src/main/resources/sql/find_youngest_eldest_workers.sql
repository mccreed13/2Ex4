SELECT 'YOUNGEST' AS TYPE, name, birthday
FROM WORKER
WHERE birthday = (
    SELECT MIN(birthday)
    FROM WORKER
)

UNION ALL

SELECT 'OLDEST' AS TYPE, name, birthday
FROM WORKER
WHERE birthday = (
    SELECT MAX(birthday)
    FROM WORKER
)
