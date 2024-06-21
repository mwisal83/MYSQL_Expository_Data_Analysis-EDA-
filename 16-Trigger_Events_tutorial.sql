-- Trigger and Events --
USE parks_and_recreation;
DELETE FROM parks_and_recreation.employee_salary WHERE employee_id=13;

SELECT *
FROM parks_and_recreation.employee_demographics;

SELECT *
FROM parks_and_recreation.employee_salary;

USE parks_and_recreation;
DELIMITER $$
CREATE TRIGGER employee_insert
	AFTER INSERT ON parks_and_recreation.employee_salary
    FOR EACH ROW
BEGIN
	INSERT INTO  parks_and_recreation.employee_demographics(employee_id, first_name, last_name)
    VALUES (NEW.employee_id, NEW.first_name, NEW.last_name);
END $$
DELIMITER ;


INSERT INTO employee_salary(employee_id, first_name, last_name, occupation, salary, dept_id)
VALUES(13, 'Jhon', 'walter', 'Genernal-Mangaer', 120000, 1);

SELECT *
FROM parks_and_recreation.employee_salary;

SELECT *
FROM parks_and_recreation.employee_demographics;

SELECT employee_id, first_name, last_name, occupation, salary, dept_id
FROM parks_and_recreation.employee_salary
GROUP BY employee_id, first_name, last_name, occupation, salary, dept_id;

DELETE 
FROM parks_and_recreation.employee_salary 
WHERE last_name = 'walter';

SELECT *
FROM parks_and_recreation.employee_salary;

-- Event --


DELIMITER $$
CREATE EVENT delete_retirees
ON SCHEDULE EVERY 30 SECOND 
DO
BEGIN
	DELETE
	FROM  parks_and_recreation.employee_demographics
    WHERE age >= 60;
END $$
DELIMITER ;

SELECT *
FROM parks_and_recreation.employee_demographics;