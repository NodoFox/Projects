USE VideoSharing;

SELECT video as video_ID,title, totalrating/rates as average_rating
FROM	
(SELECT views.video, t2.title, sum(rating) as totalrating, count(*) as rates
FROM views INNER JOIN
(SELECT video_id, title
FROM videos INNER JOIN
(SELECT video, user, rating from views where rating = '5') t1
ON t1.video=videos.video_id AND t1.user=videos.uploaded_by) t2
ON t2.video_id = views.video
WHERE views.rating IS NOT NULL
GROUP BY t2.title) t3
ORDER BY totalrating/rates
LIMIT 5;