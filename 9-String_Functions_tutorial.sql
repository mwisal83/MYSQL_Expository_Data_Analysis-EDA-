-- String Functions
SELECT first_name, LENGTH(first_name) AS st_len
FROM parks_and_recreation.employee_demographics
ORDER BY st_len;

SELECT first_name, UPPER(first_name)
FROM parks_and_recreation.employee_demographics;

SELECT first_name, LOWER(first_name)
FROM parks_and_recreation.employee_demographics;

SELECT first_name, LEFT(first_name,3)
FROM parks_and_recreation.employee_demographics;

SELECT first_name, RIGHT(first_name,3)
FROM parks_and_recreation.employee_demographics;

SELECT first_name, SUBSTRING(first_name,2,3)
FROM parks_and_recreation.employee_demographics;

SELECT first_name,birth_date, 
SUBSTRING(birth_date,1,4) AS Birth_Year, 
SUBSTRING(birth_date,6,2) AS Birth_Month,
SUBSTRING(birth_date,9,2) AS Birth_Day 
FROM parks_and_recreation.employee_demographics;

SELECT first_name, REPLACE(first_name,'a','c')
FROM parks_and_recreation.employee_demographics;

SELECT first_name, LOCATE('A', first_name)
FROM parks_and_recreation.employee_demographics;

SELECT first_name, last_name,
CONCAT(first_name,' ',last_name) AS full_name
FROM parks_and_recreation.employee_demographics;
