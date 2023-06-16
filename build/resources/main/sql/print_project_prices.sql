SELECT
    project.id,
    SUM(salary * DATEDIFF(month, start_date, finish_date)) AS price
FROM
    project, worker
                 JOIN
project_worker pw ON pw.project_id = project.id and pw.worker_id = worker.id
GROUP BY
    project.id;