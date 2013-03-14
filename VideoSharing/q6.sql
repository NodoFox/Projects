USE VideoSharing;

SELECT users.name, users.date_registered,  t5.viewcount 
FROM users LEFT OUTER JOIN
(SELECT * FROM 
(SELECT videos.video_id, videos.title, videos.uploaded_by,  CASE WHEN t3.viewcount IS NULL THEN 0 ELSE t3.viewcount END AS viewcount
FROM videos INNER JOIN
(SELECT t1.video_id, t2.viewcount
FROM
(SELECT video_id from videos) t1
LEFT OUTER JOIN
(SELECT count(*) as viewcount, video from views group by video) t2
ON t1.video_id = t2.video ) t3
ON videos.video_id=t3.video_id
ORDER BY t3.viewcount DESC) t4
GROUP BY t4.uploaded_by) t5
ON users.username = t5.uploaded_by
ORDER BY users.date_registered DESC;