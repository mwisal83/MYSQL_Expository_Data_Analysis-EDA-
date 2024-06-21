SELECT gender, AVG(salary) AS avg_salary
FROM parks_and_recreation.employee_demographics AS dem
JOIN parks_and_recreation.employee_salary AS sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender;

-- window function --

SELECT dem.first_name, dem.last_name, gender, AVG(salary) OVER(PARTITION BY gender)
FROM parks_and_recreation.employee_demographics AS dem
JOIN parks_and_recreation.employee_salary AS sal
	ON dem.employee_id = sal.employee_id;

SELECT dem.first_name, dem.last_name, gender, salary,
SUM(salary) OVER(PARTITION BY gender ORDER BY dem.employee_id) AS Rolling_Total
FROM parks_and_recreation.employee_demographics AS dem
JOIN parks_and_recreation.employee_salary AS sal
	ON dem.employee_id = sal.employee_id;
    
SELECT dem.first_name, dem.last_name, gender, salary,
SUM(salary) OVER(ORDER BY dem.employee_id) AS Rolling_Total
FROM parks_and_recreation.employee_demographics AS dem
JOIN parks_and_recreation.employee_salary AS sal
	ON dem.employee_id = sal.employee_id;

SELECT dem.employee_id,dem.first_name, dem.last_name, gender, salary,
ROW_NUMBER() OVER() AS Rownumber
FROM parks_and_recreation.employee_demographics AS dem
JOIN parks_and_recreation.employee_salary AS sal
	ON dem.employee_id = sal.employee_id;

SELECT dem.employee_id,dem.first_name, dem.last_name, gender, salary,
ROW_NUMBER() OVER(PARTITION BY gender) AS Rownumber
FROM parks_and_recreation.employee_demographics AS dem
JOIN parks_and_recreation.employee_salary AS sal
	ON dem.employee_id = sal.employee_id;


SELECT dem.employee_id,dem.first_name, dem.last_name, gender, salary,
ROW_NUMBER() OVER(PARTITION BY gender ORDER BY salary DESC) AS Rank_num,
RANK() OVER(PARTITION BY gender ORDER BY salary DESC) AS Row_num,
DENSE_RANK() OVER(PARTITION BY gender ORDER BY salary DESC) AS Den_row_num
FROM parks_and_recreation.employee_demographics AS dem
JOIN parks_and_recreation.employee_salary AS sal
	ON dem.employee_id = sal.employee_id;
