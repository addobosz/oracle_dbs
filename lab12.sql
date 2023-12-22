-- task 1
-- NULLABLE columns with value NO: PROJECT_ID

-- task 2
ALTER TABLE PROJECTS
ADD CONSTRAINT project_pk PRIMARY KEY(project_id);

ALTER TABLE PROJECTS
ADD CONSTRAINT project_name_uniq UNIQUE(project_name);

ALTER TABLE PROJECTS
MODIFY project_name NOT NULL;

ALTER TABLE PROJECTS
MODIFY start_date NOT NULL;

ALTER TABLE PROJECTS
ADD CONSTRAINT end_date_constraint CHECK(end_date > start_date);

ALTER TABLE PROJECTS
ADD CONSTRAINT budget_pos CHECK(project_budget > 0);

ALTER TABLE PROJECTS
ADD CONSTRAINT num_emp_not_neg CHECK(number_of_emp >= 0);

-- task 3
ALTER TABLE PROJECTS
MODIFY number_of_emp NOT NULL;
-- cannot modify, null values found

UPDATE PROJECTS
SET number_of_emp = 0
WHERE number_of_emp IS NULL;

ALTER TABLE PROJECTS
MODIFY number_of_emp NOT NULL;
-- now it worked out

-- task 4
ALTER TABLE Projects
ADD manager_id numeric(4,0)
CONSTRAINT fk_manager 
REFERENCES EMPLOYEES(emp_id);

-- task 5
UPDATE Projects
SET manager_id = 333
WHERE PROJECT_NAME = 'Advanced Data Analysis';

-- task 6
UPDATE Projects
SET manager_id = (SELECT emp_id FROM EMPLOYEES WHERE name || ' ' || surname = 'Mark Clark')
WHERE PROJECT_NAME = 'Advanced Data Analysis';
DELETE FROM EMPLOYEES
WHERE emp_id = (SELECT emp_id FROM EMPLOYEES WHERE name || ' ' || surname = 'Mark Clark');

-- task 7
CREATE TABLE Assignments (
    project_id integer NOT NULL,
    emp_id numeric(4,0) NOT NULL,
    function VARCHAR(100) NOT NULL,
    start_date date DEFAULT CURRENT_DATE NOT NULL,
    end_date date,
    salary numeric(8,2) NOT NULL,
    CONSTRAINT pk_assignments PRIMARY KEY(project_id, emp_id, start_date),
    CONSTRAINT fk_project FOREIGN KEY (project_id)
    REFERENCES PROJECTS(PROJECT_ID),
    CONSTRAINT fk_emp FOREIGN KEY (emp_id)
    REFERENCES EMPLOYEES(emp_id),
    CONSTRAINT check_func CHECK (function in ('designer', 'programmer', 'tester')),
    CONSTRAINT end_date_check CHECK (end_date > start_date),
    CONSTRAINT salary CHECK (salary > 0)
);
-- task 8
INSERT INTO ASSIGNMENTS(project_id, emp_id, function, start_date, end_date, salary)
VALUES (1, 180, 'programmer',  TO_DATE('09/10/1850', 'dd/mm/yyyy'), TO_DATE('01/01/2018', 'dd/mm/yyyy'), 15000);
INSERT INTO ASSIGNMENTS(project_id, emp_id, function, start_date, end_date, salary)
VALUES (2, 150, 'designer',  TO_DATE('09/12/1950', 'dd/mm/yyyy'), TO_DATE('01/04/2020', 'dd/mm/yyyy'), 1000);
INSERT INTO ASSIGNMENTS(project_id, emp_id, function, start_date, end_date, salary)
VALUES (3, 140, 'tester',  TO_DATE('12/12/2003', 'dd/mm/yyyy'), TO_DATE('22/12/2222', 'dd/mm/yyyy'), 3000);

-- task 9
INSERT INTO ASSIGNMENTS(project_id, emp_id, function, start_date, end_date, salary)
VALUES (3, 140, 'firefighter',  TO_DATE('12/12/2003', 'dd/mm/yyyy'), TO_DATE('22/12/2222', 'dd/mm/yyyy'), 3000);

-- task 10
ALTER TABLE ASSIGNMENTS DROP CONSTRAINT check_func;

-- VIEWS 

-- task 1
CREATE VIEW Professors(name, surname, hire_date, salary, add_salary, add_percent)
AS SELECT name, surname, hire_date, salary, add_salary, COALESCE(add_salary, 0)/salary
FROM EMPLOYEES
WHERE job = 'PROFESSOR';
SELECT * FROM Professors;

-- task 2
CREATE VIEW Departments_totals(dept_id, department, avg_salary, num_of_empls)
AS SELECT dept_id, dept_name, AVG(salary), COUNT(*)
FROM DEPARTMENTS JOIN EMPLOYEES USING(dept_id) 
GROUP BY dept_id, dept_name;
SELECT * FROM Departments_totals;

-- task 3
SELECT surname, name, salary, department, avg_salary, salary-avg_salary AS diff 
FROM EMPLOYEES JOIN Departments_totals USING(dept_id)
WHERE salary > avg_salary;

-- task 4
SELECT department, num_of_empls FROM Departments_totals
WHERE num_of_empls = (SELECT MAX(num_of_empls) FROM Departments_totals);

-- task 5
CREATE VIEW Emps_and_bosses(employee, emp_salary, boss, boss_salary)
AS SELECT e.surname|| ' ' ||e.name, e.salary, b.surname|| ' ' ||b.name, b.salary
FROM EMPLOYEES e JOIN EMPLOYEES b ON e.boss_id = b.emp_id; 
SELECT * FROM Emps_and_bosses
ORDER BY 1;