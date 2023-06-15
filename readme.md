1. We are tasked with finding 5 of the olders users to gift them a reward for the longest users subscribed to us?


SELECT * FROM users

ORDER BY created_at 

LIMIT 5;


![query1](https://github.com/moholomokhobo/mysql/assets/113181986/25728203-d30c-4d5f-9657-89e4f41bc2f1)


2. We are trying to schedule an ad campaign, we need to figure out what day of the week do most users register?


SELECT 
dayname(created_at) AS weekday,

COUNT(username) AS no_registrations

FROM users

GROUP BY weekday

ORDER BY no_registrations DESC;


![query2](https://github.com/moholomokhobo/mysql/assets/113181986/f18a2b61-43f7-47f0-8d29-2b21fbe2bbe5)



3. We want to target our inactive users with an email campaign, find users who have never posted a photo!


SELECT *

FROM users

LEFT JOIN photos

ON users.id = photos.user_id

WHERE image_url IS NULL;


![query3](https://github.com/moholomokhobo/mysql/assets/113181986/86985211-3f70-4c31-87a8-8f23f9ff412c)


4. We are running a contest to see who can get yhe most likes on a single photo, who won?


SELECT 

username, 

photo_id, 

COUNT(*) AS total_likes

FROM photos

JOIN likes

ON photos.id = likes.photo_id

JOIN users

ON photos.user_id = users.id

GROUP BY photos.id

ORDER BY total_likes DESC

LIMIT 5;


![query4](https://github.com/moholomokhobo/mysql/assets/113181986/cb3e6d7d-13a0-4492-9687-7a28d5d381a9)


5. investors want to know how many times does the average user post?


SELECT 


(SELECT Count(*)  FROM   photos) / (SELECT Count(*) FROM   users)  AS avg; 
 

![query5](https://github.com/moholomokhobo/mysql/assets/113181986/bf300e24-c1da-480d-967f-f0a83819d2a4)


6. what are the top 5 most commonly used hastags?                         
 
 
SELECT 

tags.tag_name, 
       
Count(*) AS total 

FROM  photo_tags 
      
JOIN tags 

ON photo_tags.tag_id = tags.id 

GROUP  BY tags.id 

ORDER  BY total DESC 

LIMIT  5;                          


![query6](https://github.com/moholomokhobo/mysql/assets/113181986/ecbf5033-521d-4b19-9c66-3a90099e25f7)


7. We have a problem with bots on our site! find users who have liked every single photo on the site
	
    
SELECT 

username, 

Count(*) AS num_likes 

FROM   users 
       
JOIN likes 

ON users.id = likes.user_id 

GROUP  BY likes.user_id 

HAVING num_likes = (SELECT Count(*) FROM  photos); 
                    
                    
![query7](https://github.com/moholomokhobo/mysql/assets/113181986/39019ad3-1b56-4226-9214-4ad4d5490c92)

