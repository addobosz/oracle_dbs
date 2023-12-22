-- task1
SELECT  e.name, e.surname, d.dept_name, d.address FROM EMPLOYEES e
LEFT OUTER JOIN DEPARTMENTS d ON e.DEPT_ID = d.DEPT_ID
ORDER BY e.SURNAME; 

-- task2
SELECT  e.name, e.surname, CASE
    WHEN d.DEPT_ID IS NOT NULL THEN d.DEPT_NAME
    ELSE  'no department'
END AS DEPT_NAME, CASE
    WHEN d.ADDRESS IS NOT NULL THEN d.ADDRESS
    ELSE 'no department'
END AS ADDRESS
 FROM EMPLOYEES e
LEFT OUTER JOIN DEPARTMENTS d ON e.DEPT_ID = d.DEPT_ID
ORDER BY e.SURNAME; 

-- task3
SELECT  
CASE
    WHEN e.NAME IS NOT NULL THEN e.NAME
    ELSE 'no employee' 
END AS NAME, 
CASE
    WHEN e.surname IS NOT NULL THEN e.SURNAME
    ELSE 'no employee' 
END AS SURNAME,
CASE
    WHEN d.DEPT_ID IS NOT NULL THEN d.DEPT_NAME
    ELSE  'no department'
END AS DEPT_NAME, CASE
    WHEN d.ADDRESS IS NOT NULL THEN d.ADDRESS
    ELSE 'no department'
END AS ADDRESS
 FROM EMPLOYEES e
FULL OUTER JOIN DEPARTMENTS d ON e.DEPT_ID = d.DEPT_ID
ORDER BY e.SURNAME; 

-- task4
SELECT d.DEPT_NAME, COUNT(e.EMP_ID) AS employees_at_dept,  SUM(e.salary) AS salaries_at_dept
FROM DEPARTMENTS d
LEFT OUTER JOIN EMPLOYEES e ON d.DEPT_ID = e.DEPT_ID
GROUP BY d.DEPT_NAME
ORDER BY d.DEPT_NAME;

-- task5
SELECT e.SURNAME AS employee, COALESCE(b.SURNAME, 'no boss') AS boss 
FROM EMPLOYEES e LEFT OUTER JOIN EMPLOYEES b ON e.BOSS_ID = b.EMP_ID 
ORDER BY e.SURNAME;

-- task6
SELECT e.SURNAME AS employee, COALESCE(b.SURNAME, 'no boss') AS boss 
FROM EMPLOYEES e LEFT OUTER JOIN EMPLOYEES b ON e.BOSS_ID = b.EMP_ID 
WHERE b.surname = 'Smith' OR b.surname = 'Wilson' OR b.surname IS NULL
ORDER BY e.SURNAME;

-- task7
SELECT  e.surname AS employee, 12*e.salary + COALESCE(e.add_salary, 0) AS emp_annual_salary, 
12*b.salary + COALESCE(b.add_salary,0) - 12*e.salary - COALESCE(e.add_salary, 0) AS less_than_boss
FROM EMPLOYEES e LEFT OUTER JOIN EMPLOYEES b ON e.boss_id = b.EMP_ID
ORDER BY e.SURNAME;

-- task8
SELECT b.surname AS boss, COUNT(e.boss_id) AS subordinates
FROM EMPLOYEES b LEFT OUTER JOIN EMPLOYEES e ON b.emp_id = e.boss_id
GROUP BY b.surname
ORDER BY b.surname;

-- task9
SELECT e.name || ' ' || e.surname AS employee, x.dept_name AS employee_department, b.name || ' ' || b.SURNAME AS boss, d.DEPT_NAME AS boss_department
FROM EMPLOYEES e INNER JOIN DEPARTMENTS x ON e.DEPT_ID = x.DEPT_ID
    INNER JOIN EMPLOYEES b ON e.BOSS_ID = b.emp_id
    INNER JOIN DEPARTMENTS d ON b.dept_id = d.DEPT_ID
ORDER BY 1;

-- task10
SELECT e.name || ' ' || e.surname AS employee, COALESCE(x.dept_name, 'no department') AS employee_department, CASE
    WHEN b.emp_id IS NOT NULL THEN b.name || ' ' || b.SURNAME
    ELSE 'no boss' 
END AS boss, COALESCE(d.DEPT_NAME , 'no department') AS boss_department
FROM EMPLOYEES e LEFT OUTER JOIN DEPARTMENTS x ON e.DEPT_ID = x.DEPT_ID
    LEFT OUTER JOIN EMPLOYEES b ON e.BOSS_ID = b.emp_id
    LEFT OUTER JOIN DEPARTMENTS d ON b.dept_id = d.DEPT_ID
ORDER BY 1;

-- task11
SELECT COUNT(*) AS rows_of_cartesian_product 
FROM EMPLOYEES CROSS JOIN DEPARTMENTS CROSS JOIN JOBS;