-- SELECTING THE DATA WE'RE GOING TO USE


SELECT * 
FROM ds_salaries;


-- WHICH COMPANIES HAS THE MOST DATA JOBS?


SELECT company_size, job_title, COUNT(job_title) as no_of_jobs_from_small_companies
FROM ds_salaries
WHERE company_size = 'S'
GROUP BY job_title ORDER BY no_of_jobs_from_small_companies DESC
LIMIT 10;


SELECT company_size, job_title, COUNT(job_title) as no_of_jobs_from_medium_companies
FROM ds_salaries
WHERE company_size = 'M'
GROUP BY job_title ORDER BY no_of_jobs_from_medium_companies DESC
LIMIT 10;


SELECT company_size, job_title, COUNT(job_title) as no_of_jobs_from_large_companies
FROM ds_salaries
WHERE company_size = 'L'
GROUP BY job_title ORDER BY no_of_jobs_from_large_companies DESC
LIMIT 10;


-- WHICH DATA JOB HAS THE MOST SALARY ANNUALY? 


SELECT job_title, FORMAT(AVG(salary_in_usd), "NO") as average_salary
FROM ds_salaries 
GROUP BY job_title ORDER BY average_salary DESC;


-- PEOPLES HOME RESIDENT AND WHERE THEY WORK 


SELECT employee_residence, COUNT(employee_residence) as no_of_emigrant_workers
FROM ds_salaries
WHERE company_location LIKE employee_residence
GROUP BY employee_residence ORDER BY no_of_emigrant_workers DESC;


SELECT company_location, employee_residence, COUNT(employee_residence) as no_of_imigrant_workers
FROM ds_salaries
WHERE company_location NOT LIKE employee_residence
GROUP BY employee_residence ORDER BY no_of_imigrant_workers DESC;


-- AVERAGE SALARY FROM 2020 TO 2022 BY EXPERIENCE!

-- | EN = 'Entry Level' | MI = 'Mid Level'| SE = 'Senior'| EX = 'Execetive Level'| 


-- 2020


SELECT work_year, experience_level, job_title, ROUND(AVG(salary_in_usd), 0) as average_salary_in_us
FROM ds_salaries
WHERE work_year = 2020 AND experience_level IN ( 'EN', 'MI', 'SE', 'EX')
GROUP BY job_title ORDER BY average_salary_in_us DESC;


-- 2021


SELECT work_year, experience_level, job_title, ROUND(AVG(salary_in_usd), 0) as average_salary_in_us
FROM ds_salaries
WHERE work_year = 2021 AND experience_level IN ( 'EN', 'MI', 'SE', 'EX')
GROUP BY job_title ORDER BY average_salary_in_us DESC;


-- 2022


SELECT work_year, experience_level, job_title, ROUND(AVG(salary_in_usd), 0) as average_salary_in_us
FROM ds_salaries
WHERE work_year = 2022 AND experience_level IN ( 'EN', 'MI', 'SE', 'EX')
GROUP BY job_title ORDER BY average_salary_in_us DESC;


-- SALARY OF TOP 10 DATA JOBS IN BIG COMPANIES BY COMAPNY LOCATION


SELECT DISTINCT work_year, company_location, job_title, FORMAT(MAX(salary_in_usd), 'NO') AS highes_salary_in_usd
FROM ds_salaries
WHERE company_location = 'US' AND work_year IN (2020, 2021, 2022)
GROUP BY job_title ORDER BY highes_salary_in_usd DESC;


SELECT DISTINCT work_year, company_location, job_title, FORMAT(MAX(salary_in_usd), "NO") AS highes_salary_in_usd
FROM ds_salaries
WHERE company_location = 'GB' AND work_year IN (2020, 2021, 2022)
GROUP BY job_title ORDER BY 2, 1 ASC;


SELECT DISTINCT work_year, company_location, job_title, FORMAT(MAX(salary_in_usd), 'NO') AS highes_salary_in_usd
FROM ds_salaries
WHERE company_location = 'CA' AND work_year IN (2020, 2021, 2022)
GROUP BY job_title ORDER BY highes_salary_in_usd DESC;




