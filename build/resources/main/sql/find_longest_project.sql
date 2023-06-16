SELECT id, DATEDIFF(month, start_date, finish_date) AS duration_months
FROM project
WHERE DATEDIFF(month, start_date, finish_date) = (
    SELECT MAX(DATEDIFF(month, start_date, finish_date))
    FROM project
);