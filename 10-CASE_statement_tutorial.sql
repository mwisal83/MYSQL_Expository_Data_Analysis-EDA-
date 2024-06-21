SELECT first_name,
last_name,
age,
CASE
	WHEN age <= 30 THEN 'Young' 
    WHEN age BETWEEN 31 AND 50 THEN 'Mid_age'
    when age>=50 THEN 'Old'
END AS Age_Bracket
FROM parks_and_recreation.employee_demographics;

-- Pay Increase Bonas --
-- <= 50000 = 5%
-- <= 70000 = 7%
-- Finance Department = 10% bonus

SELECT first_name,
last_name,
dept_id,
salary,
CASE
	WHEN salary <= 50000 THEN salary*1.05
    WHEN salary >= 50000 THEN salary*1.07
    WHEN dept_id = 6 THEN salary*1.1
END AS NEW_SALARY
FROM parks_and_recreation.employee_salary;

SELECT *
FROM parks_and_recreation.parks_departments;