-- Temporary Tables --
USE parks_and_recreation;

CREATE TEMPORARY TABLE temp_table
(first_name varchar(50),
last_name varchar(50),
favorite_movie varchar(100)
);

SELECT *
FROM temp_table;

INSERT INTO temp_table
VALUES('amir', 'jameel', 'Taare Zameen Par');

SELECT *
FROM temp_table;

CREATE TEMPORARY TABLE salary_over_45000
SELECT *
FROM parks_and_recreation.employee_salary
WHERE salary > 45000;

SELECT *
FROM salary_over_45000;
