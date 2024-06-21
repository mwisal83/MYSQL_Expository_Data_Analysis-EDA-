-- Exploratory Data Analysis --
SELECT *
FROM world_layoffs.layoffs_clean2;

SELECT MAX(total_laid_off), MAX(percentage_laid_off)
FROM world_layoffs.layoffs_clean2;

SELECT *
FROM world_layoffs.layoffs_clean2
WHERE percentage_laid_off = 1
ORDER BY total_laid_off DESC;

SELECT *
FROM world_layoffs.layoffs_clean2
WHERE percentage_laid_off = 1
ORDER BY funds_raised_millions DESC;

SELECT company, SUM(total_laid_off)
FROM world_layoffs.layoffs_clean2
GROUP BY company
ORDER BY 2 DESC;

SELECT MIN(`date`), MAX(`date`)
FROM world_layoffs.layoffs_clean2;

SELECT industry, SUM(total_laid_off)
FROM world_layoffs.layoffs_clean2
GROUP BY industry
ORDER BY 2 DESC;

SELECT country, SUM(total_laid_off)
FROM world_layoffs.layoffs_clean2
GROUP BY country
ORDER BY 2 DESC;

SELECT YEAR(`date`), SUM(total_laid_off)
FROM world_layoffs.layoffs_clean2
GROUP BY YEAR(`date`)
ORDER BY 1 DESC;

SELECT stage, SUM(total_laid_off)
FROM world_layoffs.layoffs_clean2
GROUP BY stage
ORDER BY 2 DESC;

SELECT SUBSTRING(`date`, 1, 7) AS `Month`, SUM(total_laid_off)
FROM world_layoffs.layoffs_clean2
WHERE SUBSTRING(`date`, 1, 7) IS NOT NULL
GROUP BY `Month`
ORDER BY 1 ASC;

WITH Rolling_sum AS
(
SELECT SUBSTRING(`date`, 1, 7) AS `Month`, SUM(total_laid_off) AS total_laid_off
FROM world_layoffs.layoffs_clean2
WHERE SUBSTRING(`date`, 1, 7) IS NOT NULL
GROUP BY `Month`
ORDER BY 1 ASC
)
SELECT company,YEAR(`date`), SUM(total_laid_off)
FROM Rolling_sum
GROUP BY company, YEAR(`date`)
ORDER BY company ASC;  

SELECT company,YEAR(`date`), SUM(total_laid_off)
FROM world_layoffs.layoffs_clean2
GROUP BY company, YEAR(`date`)
ORDER BY 3 DESC;  

WITH Company_year(company, years, total_laid_off) AS
(
SELECT company,YEAR(`date`), SUM(total_laid_off)
FROM world_layoffs.layoffs_clean2
GROUP BY company, YEAR(`date`)
)
SELECT *, DENSE_RANK() OVER(PARTITION BY years ORDER BY total_laid_off DESC) Rank_Dense
FROM Company_year
WHERE years IS NOT NULL
ORDER BY Rank_Dense;