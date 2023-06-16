select * from worker
where salary = (select max(salary) from worker);
