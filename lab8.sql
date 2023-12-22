-- task1
SELECT dept_id, dept_name, address FROM DEPARTMENTS d
WHERE NOT EXISTS (SELECT e.dept_id FROM EMPLOYEES e
WHERE d.DEPT_ID = e.dept_id);


-- task2
SELECT surname, job, salary FROM EMPLOYEES e1
WHERE salary > (SELECT AVG(salary) FROM EMPLOYEES e2 
WHERE e1.job = e2.job)
ORDER BY 1;

-- task3
SELECT surname, job, salary, (SELECT AVG(salary) FROM EMPLOYEES e2 
WHERE e1.job = e2.job) AS avg_sal_for_job FROM EMPLOYEES e1
WHERE salary > (SELECT AVG(salary) FROM EMPLOYEES e2 
WHERE e1.job = e2.job)
ORDER BY 1;

-- task4
SELECT surname, job, salary FROM EMPLOYEES e1
WHERE e1.salary >= 0.6*(SELECT salary FROM EMPLOYEES e2
WHERE e1.boss_id = e2.emp_id)
ORDER BY 1;

-- task5
SELECT MAX(dept_sum) AS MAX_SUM FROM 
(SELECT dept_id, SUM(salary) AS dept_sum
FROM employees
GROUP BY dept_id)
ORDER BY 1;

-- task6
SELECT DEPT_NAME, SUM(SALARY) AS SUM_OF_SAL FROM DEPARTMENTS OUTER JOIN EMPLOYEES USING(DEPT_ID) 
GROUP BY dept_name
HAVING SUM(SALARY) = (SELECT MAX(dept_sum) AS MAX_SUM FROM 
    (SELECT dept_id, SUM(salary) AS dept_sum
    FROM employees
    GROUP BY dept_id));

-- task7
SELECT dept_name AS department, surname, sum_salary AS max_salary FROM (SELECT dept_name, MAX(salary) AS sum_salary
FROM DEPARTMENTS
INNER JOIN EMPLOYEES USING(dept_id)
GROUP BY dept_name)
INNER JOIN EMPLOYEES ON salary = sum_salary
ORDER BY 1;

-- task8
SELECT e1.surname, e1.salary FROM EMPLOYEES e1
WHERE 3 > (SELECT COUNT(DISTINCT e2.salary) FROM EMPLOYEES e2
WHERE e2.salary > e1.salary)
ORDER BY e1.salary DESC;



