-- task1
SELECT * FROM DEPARTMENTS;

-- task2
SELECT * FROM EMPLOYEES

-- task3
SELECT surname, job,salary*12 FROM EMPLOYEES;

-- task4
SELECT surname, job,salary*12 AS yearly_income FROM EMPLOYEES;

-- task5
SELECT surname, job, salary+COALESCE(add_salary, 0) AS monthly_income FROM EMPLOYEES
ORDER BY 3;

-- task6
SELECT name || ' ' || surname AS assistants FROM EMPLOYEES
WHERE job = 'ASSISTANT'
ORDER BY name, surname;

-- task7
SELECT name || ' ' || surname AS employee, job, salary, dept_id FROM EMPLOYEES
WHERE dept_id = '30' OR dept_id = '40'
ORDER BY salary DESC;

-- task8
SELECT name || ' ' || surname AS employee, job, salary FROM EMPLOYEES
WHERE salary >= 1000 AND salary <= 2000
ORDER BY salary;

-- task9
SELECT name, surname FROM EMPLOYEES
WHERE surname LIKE '%son';

-- task10
SELECT name, surname FROM EMPLOYEES
WHERE dept_id IS NULL;

-- task11
SELECT name, surname, boss_id, salary FROM EMPLOYEES
WHERE boss_id IS NOT NULL AND salary >= 2000;

-- task12
SELECT name, surname, dept_id FROM EMPLOYEES
WHERE dept_id = 20 AND (surname LIKE 'W%' OR surname LIKE '%son');

-- task13
SELECT  name, surname, salary+COALESCE(add_salary, 0) AS monthly_salary FROM EMPLOYEES
WHERE salary+COALESCE(add_salary, 0) > 4000;

-- task14
SELECT 'Employee ' || name || ' ' || surname || ' works as ' || job || ' and earns ' || (salary+COALESCE(add_salary, 0))AS employees FROM EMPLOYEES
ORDER BY surname, name;
