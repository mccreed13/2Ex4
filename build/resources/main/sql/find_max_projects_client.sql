SELECT name, COUNT(*) AS project_count FROM project, client where client_id = client.id
GROUP BY client_id
HAVING COUNT(*) = (
    SELECT MAX(project_count)
    FROM (
             SELECT COUNT(*) AS project_count
             FROM project
             GROUP BY client_id
         ) AS counts
)