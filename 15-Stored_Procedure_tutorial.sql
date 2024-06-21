-- Stored Procedures --

SELECT * 
FROM parks_and_recreation.employee_salary
WHERE salary >= 50000;

USE parks_and_recreation;

DROP PROCEDURE IF EXISTS high_salaries;
CREATE PROCEDURE high_salaries(input_param INT)
SELECT * 
FROM parks_and_recreation.employee_salary
WHERE salary >= input_param;

CALL high_salaries(50000);
DROP PROCEDURE IF EXISTS salary_return;

CREATE PROCEDURE salary_return(employee_id_param INT)
SELECT salary
FROM parks_and_recreation.employee_salary
WHERE employee_id = employee_id_param;

CALL salary_return(2);
CALL salary_return(1);

