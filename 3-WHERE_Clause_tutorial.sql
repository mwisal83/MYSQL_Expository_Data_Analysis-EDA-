# WHERE CLAUSE 
SELECT *
FROM parks_and_recreation.employee_salary
WHERE salary=75000;

SELECT *
FROM parks_and_recreation.employee_salary
WHERE salary >= 50000;

SELECT *
FROM parks_and_recreation.employee_salary
WHERE first_name='Leslie';

SELECT *
FROM parks_and_recreation.employee_demographics
WHERE gender = 'Female';

SELECT *
FROM parks_and_recreation.employee_demographics
WHERE gender != 'Female';

SELECT *
FROM parks_and_recreation.employee_demographics
WHERE birth_date > '1985-01-01';

-- AND and NOT --logical operators

SELECT *
FROM parks_and_recreation.employee_demographics
WHERE birth_date > '1985-01-01'
AND gender = 'Male';

SELECT *
FROM parks_and_recreation.employee_demographics
WHERE birth_date > '1985-01-01'
OR gender = 'Male';

SELECT *
FROM parks_and_recreation.employee_demographics
WHERE birth_date > '1985-01-01'
AND NOT gender = 'Male';

SELECT *
FROM parks_and_recreation.employee_demographics
WHERE (first_name ='Leslie' AND age = 44) OR age >=55;

-- like key word--

SELECT *
FROM parks_and_recreation.employee_demographics
WHERE first_name  LIKE '%e%'; 

SELECT *
FROM parks_and_recreation.employee_demographics
WHERE first_name  LIKE 'a%';

SELECT *
FROM parks_and_recreation.employee_demographics
WHERE first_name  LIKE 'a__';

SELECT *
FROM parks_and_recreation.employee_demographics
WHERE first_name  LIKE 'a__' OR first_name  LIKE 'a___';

SELECT *
FROM parks_and_recreation.employee_demographics
WHERE birth_date  LIKE '198_%' ; 


