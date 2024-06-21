-- Inner Join --
SELECT *
FROM parks_and_recreation.employee_demographics
INNER JOIN parks_and_recreation.employee_salary
	ON employee_demographics.employee_id = employee_salary.employee_id ;
    
SELECT *
FROM parks_and_recreation.employee_demographics AS dem
INNER JOIN parks_and_recreation.employee_salary AS sal
	ON dem.employee_id = sal.employee_id ;
    
SELECT dem.employee_id, age, occupation
FROM parks_and_recreation.employee_demographics AS dem
INNER JOIN parks_and_recreation.employee_salary AS sal
	ON dem.employee_id = sal.employee_id ;
    
-- Outer Join --
SELECT *
FROM parks_and_recreation.employee_demographics AS dem
LEFT JOIN parks_and_recreation.employee_salary AS sal
	ON dem.employee_id = sal.employee_id ;
    
SELECT *
FROM parks_and_recreation.employee_demographics AS dem
RIGHT JOIN parks_and_recreation.employee_salary AS sal
	ON dem.employee_id = sal.employee_id ;
    
-- Self Join
SELECT *
FROM parks_and_recreation.employee_salary AS eps1
JOIN parks_and_recreation.employee_salary AS eps2
	ON eps1.employee_id + 1 = eps2.employee_id;
    
SELECT eps1.employee_id AS emp_santa,
eps1.first_name AS first_name_santa,
eps1.last_name AS last_name_santa,
eps2.employee_id AS emp_name,
eps2.first_name AS first_name_emp,
eps2.last_name AS last_name_emp
FROM parks_and_recreation.employee_salary AS eps1
JOIN parks_and_recreation.employee_salary AS eps2
	ON eps1.employee_id + 1 = eps2.employee_id;

-- Joining Multiple Tables Together --
SELECT *
FROM parks_and_recreation.employee_demographics AS dem
INNER JOIN parks_and_recreation.employee_salary AS sal
	ON dem.employee_id = sal.employee_id ;

SELECT * 
FROM parks_and_recreation.parks_departments;


SELECT *
FROM parks_and_recreation.employee_demographics AS dem
INNER JOIN parks_and_recreation.employee_salary AS sal
	ON dem.employee_id = sal.employee_id 
INNER JOIN parks_and_recreation.parks_departments AS pd
	ON sal.dept_id = pd.department_id;