-- task1
SELECT surname, salary, 
CASE
  WHEN salary < 1500
    THEN 'low paid'
  WHEN salary > 1500 AND salary < 3000
    THEN 'average paid'
  ELSE 'well paid'
END AS label FROM EMPLOYEES
ORDER BY surname;

-- task2
SELECT DISTINCT boss_id FROM EMPLOYEES
WHERE boss_id IS NOT NULL
ORDER BY boss_id;

-- task3
SELECT DISTINCT dept_id, job FROM EMPLOYEES
ORDER BY dept_id;

-- task4
SELECT DISTINCT TO_CHAR(hire_date, 'yyyy') AS years FROM EMPLOYEES
ORDER BY 1;

-- task5
SELECT DISTINCT dept_id FROM DEPARTMENTS
EXCEPT 
SELECT DISTINCT dept_id FROM EMPLOYEES;

-- task6
SELECT surname, salary, 'low paid' AS label FROM EMPLOYEES
WHERE salary < 1500
UNION 
SELECT surname, salary, 'average paid' AS label FROM EMPLOYEES
WHERE salary > 1500 AND salary < 3000
UNION 
SELECT surname, salary, 'well paid' AS label FROM EMPLOYEES
WHERE salary > 3000
ORDER BY surname; 