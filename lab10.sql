-- task1
INSERT INTO EMPLOYEES(emp_id, name, surname, job, boss_id, hire_date, salary, add_salary, dept_id)
VALUES(320, 'Francis', 'Dormand', 'ASSISTANT', 110, TO_DATE('01/01/2018','dd/mm/yyyy'), 3900, NULL, 40);
SELECT * FROM EMPLOYEES
WHERE emp_id >= 300;

-- task2
INSERT INTO DEPARTMENTS(DEPT_ID, DEPT_NAME, ADDRESS)
VALUES(70, 'DATABASE SYSTEMS', DEFAULT);
SELECT * FROM DEPARTMENTS
WHERE dept_id = 70;

-- task3
UPDATE EMPLOYEES 
SET dept_id = 70
WHERE emp_id >= 300;
SELECT * FROM EMPLOYEES
WHERE dept_id = 70;

-- task4
UPDATE EMPLOYEES 
SET salary = salary*1.1,
add_salary = COALESCE(1.2*add_salary, 100)
WHERE dept_id = 70;

SELECT * FROM EMPLOYEES
WHERE dept_id = 70
ORDER BY surname;

-- task5
UPDATE EMPLOYEES
SET salary = salary+0.1*(
    SELECT AVG(salary) FROM EMPLOYEES
    WHERE dept_id = 10
)
WHERE dept_id = 70;

SELECT * FROM EMPLOYEES
WHERE dept_id = 70
ORDER BY surname;

-- task6
DELETE FROM DEPARTMENTS
WHERE dept_name = 'DATABASE SYSTEMS';
-- error: "integrity constraint (DBS156047.FK_DEPARTMENT) violated - child record found"
-- We cannot delete an entity that has has other entities related to it (employees linked to department in this case).
-- Reference integrity would be violated.

-- task7
DELETE FROM EMPLOYEES
WHERE salary < 5000 and dept_id = 70;
UPDATE EMPLOYEES
SET dept_id = DEFAULT
WHERE dept_id = 70;
SELECT * FROM EMPLOYEES
ORDER BY emp_id;

-- task8
DELETE FROM DEPARTMENTS
WHERE dept_name = 'DATABASE SYSTEMS';
SELECT * FROM DEPARTMENTS;

-- task9
DELETE FROM EMPLOYEES 
WHERE name = 'Jack' and surname = 'Snow';
SELECT * FROM EMPLOYEES;
