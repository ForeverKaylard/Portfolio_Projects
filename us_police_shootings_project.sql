
-- SELECTING DATA THAT WE ARE USING

SELECT * FROM uspoliceshootings;


SELECT id, name, age, race, gender, state, date, armed, gender
FROM uspoliceshootings;


-- Looking at cevilians that were armed with guns, knifes and others unarmed in these cases


SELECT DISTINCT (armed) FROM uspoliceshootings;


SELECT state, COUNT(armed) as num_of_gun_cases 
FROM uspoliceshootings 
WHERE armed = 'gun' 
GROUP BY state ORDER BY num_of_gun_cases DESC;


SELECT state, COUNT(armed) as num_of_knife_cases 
FROM uspoliceshootings 
WHERE armed = 'knife' 
GROUP BY state ORDER BY num_of_knife_cases DESC;


SELECT state, COUNT(armed) as num_of_unarmed_cases 
FROM uspoliceshootings 
WHERE armed = 'unarmed' 
GROUP BY state ORDER BY num_of_unarmed_cases DESC;


-- CA, TX, FL... are states with most cases for (guns, knifes and unarmed)

-- Average age of people are getting killed at and their state?


SELECT state, armed, ROUND(AVG(age), 0) AS average_age 
FROM uspoliceshootings 
WHERE armed = 'gun' 
GROUP BY state ORDER BY average_age; 


SELECT state, armed, ROUND(AVG(age), 0) AS average_age 
FROM uspoliceshootings 
WHERE armed = 'knife' 
GROUP BY state ORDER BY average_age;


SELECT state, armed, ROUND(AVG(age), 0) AS average_age 
FROM uspoliceshootings 
WHERE armed = 'unarmed' 
GROUP BY state ORDER BY average_age;


-- Which states has highest civilians with guns, knifes or unarmed during police killings!


SELECT city, COUNT(city) AS no_of_persons_armed_with_gun 
FROM uspoliceshootings 
WHERE armed = 'gun' 
GROUP BY city ORDER BY no_of_persons_armed_with_gun DESC;


SELECT city, COUNT(city) AS no_of_persons_armed_with_knife 
FROM uspoliceshootings 
WHERE armed = 'knife' 
GROUP BY city ORDER BY no_of_persons_armed_with_knife DESC;


SELECT city, COUNT(city) AS no_of_persons_armed_with_unarmed 
FROM uspoliceshootings 
WHERE armed = 'unarmed' 
GROUP BY city ORDER BY no_of_persons_armed_with_unarmed DESC;


-- Cases Where People Were Affected By Mental Issues!


SELECT DISTINCT state, COUNT(state) AS no_of_persons_with_mental_illness
FROM uspoliceshootings
WHERE signs_of_mental_illness = 'TRUE'
GROUP BY state ORDER BY no_of_persons_with_mental_illness DESC;


SELECT DISTINCT state, COUNT(state) AS no_of_persons_with_mental_illness
FROM uspoliceshootings
WHERE signs_of_mental_illness = 'FALSE'
GROUP BY state ORDER BY no_of_persons_with_mental_illness DESC;


-- CASES WHERE POLICE WORE OR NOT WORE BODY CAMS !!


SELECT state, COUNT(body_camera) AS police_without_body_cam
FROM uspoliceshootings 
WHERE body_camera = 'FALSE'
GROUP BY state ORDER BY police_without_body_cam DESC;


SELECT state, COUNT(body_camera) AS police_without_body_cam
FROM uspoliceshootings 
WHERE body_camera = 'TRUE'
GROUP BY state ORDER BY police_without_body_cam DESC;


-- FROM 2015 TO 2022 WHICH RACE IS MOSTLY KILLED BY COPS?


SELECT race, COUNT(race) AS no_of_people_per_race
FROM uspoliceshootings
WHERE manner_of_death = 'shot' OR 'shot and Tasered'
GROUP BY race ORDER BY no_of_people_per_race DESC;


SELECT gender, COUNT(gender) AS no_of_people 
FROM uspoliceshootings
WHERE manner_of_death = 'shot' OR 'shot and Tasered' AND gender IS NULL
GROUP BY gender ORDER BY no_of_people DESC;









