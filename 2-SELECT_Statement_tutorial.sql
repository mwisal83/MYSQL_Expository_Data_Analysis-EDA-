select * 
FROM parks_and_recreation.employee_demographics;

select last_name
FROM parks_and_recreation.employee_demographics;

select first_name,last_name,birth_date
FROM parks_and_recreation.employee_demographics;

select first_name,
last_name,
birth_date,
age,
age+10
FROM parks_and_recreation.employee_demographics;

select first_name,
last_name,
birth_date,
age,
(age + 10) * 10 + 10
FROM parks_and_recreation.employee_demographics;
#PEMDAS

SELECT DISTINCT gender
FROM parks_and_recreation.employee_demographics;