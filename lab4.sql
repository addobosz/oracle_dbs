--task1
SELECT MIN(salary) AS minimum_salary, MAX(salary) AS maximum_salary, MAX(SALARY) - MIN(salary) AS difference FROM employees;

--task2
SELECT COUNT(emp_id) AS employees_without_dept FROM employees
WHERE dept_id IS NULL; 

--task3
SELECT COUNT(*) AS professors FROM employees
WHERE job = 'PROFESSOR';

--task4
SELECT job, TO_CHAR(AVG(salary),'9999.00') FROM employees
GROUP BY job
ORDER BY 2 DESC;

--task5
SELECT job, TO_CHAR(AVG(salary+COALESCE(ADD_SALARY, 0)),'9999.00') AS job_average_salary, COUNT(*) AS employees 
FROM employees
GROUP BY job
ORDER BY 2 DESC;

--task6
SELECT job, TO_CHAR(AVG(salary+COALESCE(ADD_SALARY, 0)),'9999.00') AS job_average_salary, COUNT(*) AS employees FROM employees
GROUP BY job
HAVING COUNT(*) != 1
ORDER BY 2 DESC;

--task7
SELECT dept_id, COUNT(*) AS employees_with_add_salary FROM EMPLOYEES
WHERE ADD_SALARY IS NOT NULL AND dept_id IS NOT NULL
GROUP BY dept_id
ORDER BY DEPT_ID;

--task8
SELECT dept_id, COUNT(*), TO_CHAR(AVG(ADD_SALARY), '9999.00') AS avg_add_salary, TO_CHAR(SUM(ADD_SALARY), '9999.00') AS employees_with_add_salary FROM EMPLOYEES
WHERE ADD_SALARY IS NOT NULL AND dept_id IS NOT NULL
GROUP BY dept_id
ORDER BY DEPT_ID;

--task9
SELECT boss_id, COUNT(*) AS number_of_subordinates FROM employees
WHERE boss_id IS NOT NULL
GROUP BY boss_id
ORDER BY boss_id;

--task10
SELECT TO_CHAR(hire_date, 'yyyy') as year_of_employment, COUNT(*) as number_of_employees
FROM EMPLOYEES
GROUP BY TO_CHAR(hire_date, 'yyyy')
ORDER BY 1;

--task11
SELECT LENGTH(surname) AS surname_length, COUNT(*) AS number_of_employees FROM EMPLOYEES
GROUP BY LENGTH(surname)
ORDER BY 1;

--task12 
SELECT SUM(COUNT(*)) AS surnames_with_a FROM employees
WHERE UPPER(surname) LIKE '%A%'
GROUP BY surname;

SELECT SUM(COUNT(*)) AS surnames_with_e FROM employees
WHERE UPPER(surname) LIKE '%E%'
GROUP BY surname;

--task13
SELECT 
COUNT(CASE
    WHEN UPPER(surname) LIKE '%A%' AND UPPER(surname) IS NOT NULL THEN surname
    END) AS surnames_with_a,
COUNT(CASE
    WHEN UPPER(surname) LIKE '%E%' AND UPPER(surname) IS NOT NULL THEN surname
    END) AS surnames_with_e
FROM employees;