-- Data Cleaning --
SELECT *
FROM world_layoffs.layoffs;

-- 1. Remove duplicate if exists --
-- 2. Standarize the data --
-- 3. Null or missing values/data --
-- 4. Remove irrelvant data/colums --


CREATE TABLE layoffs_clean
LIKE layoffs;

SELECT *
FROM world_layoffs.layoffs_clean;

INSERT world_layoffs.layoffs_clean
SELECT *
FROM  world_layoffs.layoffs;

-- 1. Removing Duplicate data --
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, location, industry, total_laid_off,percentage_laid_off, `date`) AS row_num
FROM world_layoffs.layoffs_clean;

WITH duplicate_cte AS
(
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, location, industry, total_laid_off,percentage_laid_off,
 `date`, stage, country, funds_raised_millions) AS row_num
FROM world_layoffs.layoffs_clean
)
SELECT *
FROM duplicate_cte
WHERE row_num >1;

SELECT *
FROM world_layoffs.layoffs_clean
WHERE company = 'Casper';


USE world_layoffs;
CREATE TABLE `layoffs_clean2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` INT 
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


SELECT *
FROM layoffs_clean2;

INSERT INTO layoffs_clean2
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, location, industry, total_laid_off,percentage_laid_off,
 `date`, stage, country, funds_raised_millions) AS row_num
FROM world_layoffs.layoffs_clean;

DELETE
FROM world_layoffs.layoffs_clean2
WHERE row_num > 1;

SELECT *
FROM layoffs_clean2
WHERE row_num > 1;

-- 2. Standarize the data --
SELECT DISTINCT(TRIM(company))
FROM world_layoffs.layoffs_clean2;

SELECT company,TRIM(company)
FROM world_layoffs.layoffs_clean2;

UPDATE world_layoffs.layoffs_clean2
SET company = TRIM(company);

SELECT DISTINCT industry
FROM world_layoffs.layoffs_clean2
ORDER BY 1;

SELECT *
FROM world_layoffs.layoffs_clean2
WHERE industry LIKE 'Crypto%';

UPDATE world_layoffs.layoffs_clean2
SET industry = 'Crypto'
WHERE industry LIKE 'Crypto%';

SELECT DISTINCT country
FROM world_layoffs.layoffs_clean2
ORDER BY 1;

UPDATE world_layoffs.layoffs_clean2
SET country = 'United States'
WHERE country LIKE 'United State%';

SELECT *
FROM world_layoffs.layoffs_clean2
WHERE country = 'United States';

SELECT `date`,
STR_TO_DATE(`date`, '%m/%d/%Y')
FROM world_layoffs.layoffs_clean2;

UPDATE world_layoffs.layoffs_clean2
SET `date` = STR_TO_DATE(`date`, '%m/%d/%Y');

SELECT `date`
FROM world_layoffs.layoffs_clean2;

ALTER TABLE world_layoffs.layoffs_clean2
MODIFY COLUMN `date` DATE;

SELECT *
FROM world_layoffs.layoffs_clean2
WHERE industry is NULL OR industry = ''; 

SELECT *
FROM world_layoffs.layoffs_clean2
WHERE company = 'Airbnb';

UPDATE world_layoffs.layoffs_clean2
SET industry = NULL
WHERE industry = '';

SELECT t1.industry, t2.industry
FROM world_layoffs.layoffs_clean2 t1
JOIN world_layoffs.layoffs_clean2 t2
	ON t1.company = t2.company
    AND t1.location = t2.location
WHERE t1.industry IS NULL
AND t2.industry is NOT NULL;

UPDATE world_layoffs.layoffs_clean2 t1
JOIN world_layoffs.layoffs_clean2 t2
	ON t1.company = t2.company
    SET t1.industry = t2.industry
WHERE t1.industry IS NULL
AND t2.industry is NOT NULL;

SELECT *
FROM world_layoffs.layoffs_clean2
WHERE company LIKE 'Bally%';

SELECT *
FROM world_layoffs.layoffs_clean2
WHERE total_laid_off is NULL AND
percentage_laid_off is NULL;

DELETE
FROM world_layoffs.layoffs_clean2
WHERE total_laid_off is NULL AND
percentage_laid_off is NULL;

SELECT *
FROM world_layoffs.layoffs_clean2;

ALTER TABLE layoffs_clean2
DROP COLUMN row_num;
