-- task1
SELECT  EMPLOYEES.name, EMPLOYEES.surname, DEPARTMENTS.dept_id, DEPARTMENTS.address
FROM EMPLOYEES INNER JOIN DEPARTMENTS ON EMPLOYEES.dept_id = DEPARTMENTS.dept_id
ORDER BY 2; 

-- task2
SELECT 'Employee ' || EMPLOYEES.name || ' ' ||  EMPLOYEES.surname || ' works in ' || DEPARTMENTS.dept_name || ' located at ' || DEPARTMENTS.address AS sentence
FROM EMPLOYEES INNER JOIN DEPARTMENTS ON EMPLOYEES.dept_id = DEPARTMENTS.dept_id
ORDER BY EMPLOYEES.surname;

-- task3
SELECT e.surname, e.salary
FROM EMPLOYEES e JOIN DEPARTMENTS d ON e.dept_id = d.dept_id
WHERE d.address = '47TH STR'
ORDER BY 1;

-- task4
SELECT COUNT(*) AS employees_at_47th_str, TO_CHAR(AVG(e.salary), '9999.00') AS avg_salary
FROM EMPLOYEES e JOIN DEPARTMENTS d ON e.dept_id = d.dept_id
WHERE d.address = '47TH STR'
ORDER BY 1;

-- task5
SELECT e.surname , e.job, TO_CHAR(e.salary, '9999.00'), TO_CHAR(j.MIN_SALARY, '9999.00') AS job_min_salary, TO_CHAR(j.MAX_SALARY, '9999.00') AS job_max_salary
FROM EMPLOYEES e JOIN JOBS j ON e.job = j.NAME
ORDER BY 1;

-- task6
SELECT e.surname , e.job, TO_CHAR(e.salary, '9999.00'), TO_CHAR(j.MIN_SALARY, '9999.00') AS job_min_salary, TO_CHAR(j.MAX_SALARY, '9999.00') AS job_max_salary
FROM EMPLOYEES e INNER JOIN JOBS j ON e.job = j.name
WHERE e.salary NOT BETWEEN j.min_salary AND j.max_salary
ORDER BY 1;

-- task7
SELECT e.surname, e.job, TO_CHAR(e.salary, '9999.00'), TO_CHAR(j.min_salary, '9999.0') AS job_min_salary, TO_CHAR(j.max_salary, '9999.00') AS job_max_salary
FROM EMPLOYEES e JOIN JOBS j ON e.salary 
BETWEEN j.MIN_SALARY AND j.MAX_SALARY
WHERE j.name = 'ASSISTANT'
ORDER BY 1;

-- task8
SELECT d.dept_name AS department, COUNT(*) AS employees_at_dept,  SUM(e.salary) AS salaries_at_dept
FROM EMPLOYEES e JOIN DEPARTMENTS d ON e.dept_id = d.dept_id
GROUP BY d.dept_name
ORDER BY 1;

-- task9
SELECT d.dept_name AS department, COUNT(*) AS employees_at_dept,  SUM(e.salary) AS salaries_at_dept
FROM EMPLOYEES e JOIN DEPARTMENTS d ON e.dept_id = d.dept_id
GROUP BY d.dept_name
HAVING COUNT(*) >= 2
ORDER BY 1;

-- task10
SELECT d.dept_name AS department, CASE 
    WHEN COUNT(*) <= 2 THEN 'small'
    WHEN COUNT(*) BETWEEN 3 AND 6 THEN 'medium'
    WHEN COUNT(*) > 6 THEN 'big' 
END AS label
FROM EMPLOYEES e JOIN DEPARTMENTS d ON e.dept_id = d.dept_id
GROUP BY d.dept_name
ORDER BY 1;