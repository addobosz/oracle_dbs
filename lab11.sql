-- task 1
CREATE TABLE Projects (
    project_id integer GENERATED ALWAYS AS IDENTITY,
    project_name VARCHAR(200),
    description VARCHAR(1000),
    start_date date DEFAULT CURRENT_DATE,
    end_date date,
    budget numeric(10,2)
);

-- task 2
INSERT INTO Projects(project_name, description, start_date, budget)
VALUES ('New Technologies Survey', 'A project aimed at reviewing the area
of advanced database technologies.', TO_DATE('01/01/2018','dd/mm/yyyy'), 1500000);
INSERT INTO Projects(project_name, description, start_date, end_date, budget)
VALUES ('Advanced Data Analysis', 'Analyzing data obtained from various
organizations.', TO_DATE('20/09/2017','dd/mm/yyyy'), TO_DATE('01/10/2018','dd/mm/yyyy'), 2750000);

-- task 3
-- This won't succeed, because user can not specify value of project_id column.

-- task 4
INSERT INTO Projects(project_name, description, start_date, end_date, budget)
VALUES ('Creating backbone network', 'Expanding the organization''s network
infrastructure.', TO_DATE('01/07/2019','dd/mm/yyyy'), TO_DATE('31/05/2020','dd/mm/yyyy'), 5000000);

SELECT project_id, project_name FROM Projects;

-- task 5
-- ERROR: "cannot update a generated always identity column"
UPDATE Projects
SET project_id = 100
WHERE project_name = 'Creating backbone network';

-- task 6
CREATE TABLE Projects_Copy AS
    SELECT * FROM PROJECTS;

-- task 7
INSERT INTO Projects_Copy(project_id, project_name, description, start_date, end_date, budget)
VALUES (100, 'Creating mobile network', 'Expanding the organization''s network
infrastructure – part 2.', TO_DATE('01/06/2020','dd/mm/yyyy'), TO_DATE('31,05,2021', 'dd/mm/yyyy'), 4000000);
SELECT * FROM Projects_Copy;
-- I think that copied table didn't inherit the constraint regarding project_id being identity column from the primary table.

-- task 8
DELETE FROM PROJECTS_COPY
WHERE project_name = 'Creating backbone network';
-- removal went successfully.

-- task 9
ALTER TABLE Projects
ADD number_of_emp numeric(3)
MODIFY description varchar(1500);

-- task 10
-- ERROR: "cannot decrease column length because some value is too big"
SELECT MAX(LENGTH(PROJECT_NAME)) FROM PROJECTS;
ALTER TABLE Projects
MODIFY PROJECT_NAME varchar(10);

-- task 11
ALTER TABLE Projects
RENAME COLUMN budget TO project_budget;

-- task 12
DROP TABLE Projects_Copy;
