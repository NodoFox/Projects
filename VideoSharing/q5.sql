USE VideoSharing;

SELECT users.name,F.title,F.uploaded_at
FROM users INNER JOIN
(
SELECT TT.video_id, TT.title, TT.uploaded_by, TT.uploaded_at
FROM (
SELECT videos.video_id,videos.title, videos.uploaded_by, videos.uploaded_at, T1.viewed_at, TIMESTAMPDIFF(SECOND,T1.viewed_at,videos.uploaded_at) as Timer 
FROM
videos
LEFT OUTER JOIN
(SELECT video,viewed_at FROM (SELECT video, viewed_at from views order by viewed_at DESC) latest_times GROUP BY video ORDER BY viewed_at DESC) T1
ON T1.video=videos.video_id) TT
WHERE (TT.timer> -1209600) OR (TT.timer IS NULL)) F
ON users.username = F.uploaded_by;