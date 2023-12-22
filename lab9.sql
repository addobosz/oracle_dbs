-- task1
WITH avg_structure AS (SELECT job, AVG(salary) AS avg_sal_for_job
FROM EMPLOYEES
GROUP BY job)
SELECT surname, job, salary, avg_sal_for_job FROM EMPLOYEES
INNER JOIN avg_structure using(job)
WHERE salary > avg_sal_for_job
ORDER BY 1;

-- task2
WITH sum_structure AS (SELECT dept_id, SUM(salary) AS sum_of_sal
FROM EMPLOYEES
GROUP BY dept_id)
SELECT dept_name, sum_of_sal FROM DEPARTMENTS
INNER JOIN sum_structure USING(dept_id)
WHERE sum_of_sal = (SELECT MAX(sum_of_sal) FROM sum_structure);

-- task3
WITH boss_struct AS (
    SELECT emp_id AS boss_emp_id, surname AS boss_name, salary AS boss_salary FROM EMPLOYEES
    WHERE emp_id IN (SELECT DISTINCT boss_id FROM EMPLOYEES)
) 
SELECT surname, salary, boss_name, boss_salary FROM EMPLOYEES
JOIN boss_struct ON boss_id = boss_emp_id
WHERE salary >= 0.6*boss_salary
ORDER BY 1;

-- task4
SELECT surname, hire_date FROM EMPLOYEES
ORDER BY 2
FETCH FIRST ROW ONLY;

-- task5
WITH longest_working AS (SELECT surname AS longest_surname, hire_date AS longest_hire_date 
FROM EMPLOYEES
ORDER BY 2
FETCH FIRST ROW ONLY)
SELECT surname, (hire_date - longest_hire_date) AS num_of_days FROM EMPLOYEES
CROSS JOIN longest_working
ORDER BY 2;

-- task6
WITH digits AS (
    SELECT 0 AS digit, 'zero' AS word
    FROM dual
    UNION ALL
    SELECT 1, 'one'
    FROM dual
    UNION ALL
    SELECT 2, 'two'
    FROM dual
    UNION ALL
    SELECT 3, 'three'
    FROM dual
    UNION ALL
    SELECT 4, 'four'
    FROM dual
    UNION ALL
    SELECT 5, 'five'
    FROM dual
    UNION ALL
    SELECT 6, 'six'
    FROM dual
    UNION ALL
    SELECT 7, 'seven'
    FROM dual
    UNION ALL
    SELECT 8, 'eight'
    FROM dual
    UNION ALL
    SELECT 9, 'nine'
    FROM dual
    ORDER BY 1
)
SELECT surname || ' earns ' || word || ' grand' AS SENTENCE FROM EMPLOYEES
INNER JOIN digits ON (ROUND(salary/1000) = digit)
ORDER BY 1;

-- task7
WITH
emp_hierarchy(emp_id, boss_id, name, surname, hier_level) AS(SELECT emp_id, boss_id, name, surname, name || ' ' || surname
FROM employees
WHERE surname='Smith'
UNION ALL
SELECT e.emp_id, e.boss_id, e.name,
e.surname, hier_level || ' -> ' || e.name || ' ' || e.surname
FROM employees e JOIN
emp_hierarchy h
ON e.boss_id = h.emp_id)
SEARCH DEPTH FIRST
BY surname SET sibl_order
SELECT name || ' ' || surname AS EMPLOYEE, hier_level AS HIERARCHY
FROM emp_hierarchy
ORDER BY hier_level, name;