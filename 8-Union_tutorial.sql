SELECT *
FROM parks_and_recreation.employee_demographics
UNION
SELECT *
FROM parks_and_recreation.employee_salary;

SELECT age, gender
FROM parks_and_recreation.employee_demographics
UNION
SELECT first_name, last_name
FROM parks_and_recreation.employee_salary;

SELECT first_name, last_name
FROM parks_and_recreation.employee_demographics
UNION DISTINCT
SELECT first_name, last_name
FROM parks_and_recreation.employee_salary;

SELECT first_name, last_name
FROM parks_and_recreation.employee_demographics
UNION ALL
SELECT first_name, last_name
FROM parks_and_recreation.employee_salary;

SELECT first_name, last_name, 'Old Man' AS label
FROM parks_and_recreation.employee_demographics
WHERE age>40 AND gender= 'Male'
UNION
SELECT first_name, last_name, 'Old lady' AS label
FROM parks_and_recreation.employee_demographics
WHERE age>40 AND gender= 'Female'
UNION
SELECT first_name, last_name, 'Highly Paid Employee' AS label
FROM parks_and_recreation.employee_salary
WHERE salary>70000
ORDER BY first_name, last_name;