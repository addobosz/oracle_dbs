-- 1
SELECT surname, emp_id, UPPER(SUBSTR(surname,1,2)) || emp_id AS login 
FROM employees
ORDER BY surname ASC;
-- 2
SELECT surname FROM employees
WHERE UPPER(surname) LIKE '%L%';
-- 3
SELECT surname FROM employees
WHERE SUBSTR(UPPER(surname),1,LENGTH(surname)/2) LIKE '%L%'
ORDER BY surname ASC;
-- 4
SELECT surname, salary AS original_salary, ROUND(salary*1.15) AS increased_salary FROM employees
ORDER BY surname ASC;
-- 5
SELECT TO_CHAR(CURRENT_DATE, 'Day') AS "TODAY IS" FROM DUAL;
-- 6
SELECT TO_CHAR(DATE '2003-09-29', 'Day') AS "I was born on" FROM DUAL;
-- 7
SELECT surname, TO_CHAR(hire_date, 'dd MONTH yyyy, Day') AS hire_date FROM employees
ORDER BY surname ASC;
-- 8
SELECT surname, job, (date '2000-01-01' - hire_date) YEAR TO MONTH AS EXPERIENCE_IN_2000 FROM employees
WHERE job IN ('PROFESSOR', 'LECTURER', 'ASSISTANT')
ORDER BY hire_date, surname DESC;
-- 9
SELECT surname, job, (date '2000-01-01' - hire_date) YEAR TO MONTH AS EXPERIENCE_IN_2000 FROM employees
WHERE job IN ('PROFESSOR', 'LECTURER', 'ASSISTANT') AND ((date '2000-01-01' - hire_date) YEAR TO MONTH > INTERVAL'+10-0' YEAR TO MONTH)
ORDER BY hire_date, surname DESC;
-- 10
SELECT surname, job, EXTRACT (YEAR FROM (date '2000-01-01' - hire_date) YEAR TO MONTH)  AS EXPERIENCE_IN_2000 FROM employees
WHERE job IN ('PROFESSOR', 'LECTURER', 'ASSISTANT') AND ((date '2000-01-01' - hire_date) YEAR TO MONTH > INTERVAL'+10-0' YEAR TO MONTH)
ORDER BY hire_date, surname DESC;