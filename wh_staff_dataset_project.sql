
-- SELECTING WHITE HOUSE DATA FROM 1997 - 2020: USING FOUR QUATERS 
-- | Q1 = 1997 - 2002 | Q2 = 2003 - 2008 | Q3 = 2009 - 2014 | Q4 = 2015 - 2020 |


SELECT * 
FROM wh_staff_dataset;


-- HOW MANY PEOPLE WORK IN THE WHITE HOUSE GENDER SPECIFICALY?


SELECT gender, COUNT(gender) AS no_of_employees_in_wh
FROM wh_staff_dataset
WHERE year BETWEEN 1997 AND 2002
GROUP BY gender; 


SELECT gender, COUNT(gender) AS no_of_employees_in_wh
FROM wh_staff_dataset
WHERE year BETWEEN 2003 AND 2008
GROUP BY gender;


SELECT gender, COUNT(gender) AS no_of_employees_in_wh
FROM wh_staff_dataset
WHERE year BETWEEN 2009 AND 2014
GROUP BY gender;


SELECT gender, COUNT(gender) AS no_of_employees_in_wh
FROM wh_staff_dataset
WHERE year BETWEEN 2015 AND 2020
GROUP BY gender;


-- WHAT'S THE HIGHEST SALARY AND POSITION PER GENDER?


SELECT gender, position_title ,FORMAT(MAX(salary),"NO") AS highest_salary_per_gender 
FROM wh_staff_dataset
WHERE year BETWEEN 1997 AND 2002
GROUP BY gender ORDER BY highest_salary_per_gender DESC;


SELECT gender, position_title ,FORMAT(MAX(salary),"NO") AS highest_salary_per_gender 
FROM wh_staff_dataset
WHERE year BETWEEN 2003 AND 2008
GROUP BY gender ORDER BY highest_salary_per_gender DESC;


SELECT gender, position_title ,FORMAT(MAX(salary),"NO") AS highest_salary_per_gender 
FROM wh_staff_dataset
WHERE year BETWEEN 2009 AND 2014
GROUP BY gender ORDER BY highest_salary_per_gender DESC;


SELECT gender, position_title ,FORMAT(MAX(salary),"NO") AS highest_salary_per_gender 
FROM wh_staff_dataset
WHERE year BETWEEN 2015 AND 2020
GROUP BY gender ORDER BY highest_salary_per_gender DESC;


-- NUMBER OF EMPLOYEES BY POSITION!


SELECT position_title, COUNT(gender) AS no_of_employees_per_position
FROM wh_staff_dataset
WHERE year BETWEEN 1997 AND 2002
GROUP BY position_title ORDER BY no_of_employees_per_position DESC;


SELECT position_title, COUNT(gender) AS no_of_employees_per_position
FROM wh_staff_dataset
WHERE year BETWEEN 2003 AND 2008
GROUP BY position_title ORDER BY no_of_employees_per_position DESC;


SELECT position_title, COUNT(gender) AS no_of_employees_per_position
FROM wh_staff_dataset
WHERE year BETWEEN 2009 AND 2014
GROUP BY position_title ORDER BY no_of_employees_per_position DESC;


SELECT position_title, COUNT(gender) AS no_of_employees_per_position
FROM wh_staff_dataset
WHERE year BETWEEN 2015 AND 2020
GROUP BY position_title ORDER BY no_of_employees_per_position DESC;


-- SALARY PER POSITION 


SELECT position_title, FORMAT((salary),"NO") AS employee_salary
FROM wh_staff_dataset
WHERE year BETWEEN 1997 AND 2002
ORDER BY salary DESC
LIMIT 50;


SELECT position_title, FORMAT((salary),"NO") AS employee_salary
FROM wh_staff_dataset
WHERE year BETWEEN 2003 AND 2008
ORDER BY salary DESC
LIMIT 50;


SELECT position_title, FORMAT((salary),"NO") AS employee_salary
FROM wh_staff_dataset
WHERE year BETWEEN 2009 AND 2014
ORDER BY salary DESC
LIMIT 50;


SELECT position_title, FORMAT((salary),"NO") AS employee_salary
FROM wh_staff_dataset
WHERE year BETWEEN 2015 AND 2020
ORDER BY salary DESC
LIMIT 50;


-- HIGHEST SALARY PER YEAR MALE AND FEMALE


SELECT gender, year, FORMAT(MAX(salary), "NO") AS highest_salary, FORMAT(AVG(salary), "NO") AS average_salary
FROM wh_staff_dataset
WHERE gender = "male" AND year BETWEEN 1997 AND 2020
GROUP BY year;


SELECT gender, year, FORMAT(MAX(salary), "NO") AS highest_salary, FORMAT(AVG(salary), "NO") AS average_salary
FROM wh_staff_dataset
WHERE gender = "female" AND year BETWEEN 1997 AND 2020
GROUP BY year;


-- HIGHEST SALARY IN SAME POSITION TITLE MALE VERSUS FEMALE!


SELECT position_title, gender, FORMAT(MAX(salary), "NO") AS highest_salary
FROM wh_staff_dataset
WHERE gender = "male"
GROUP BY position_title ORDER BY highest_salary DESC;


SELECT position_title, gender, FORMAT(MAX(salary), "NO") AS highest_salary
FROM wh_staff_dataset
WHERE gender = "female"
GROUP BY position_title ORDER BY highest_salary DESC;
