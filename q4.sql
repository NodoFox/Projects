USE VideoSharing;

SELECT users.name, s*ad_count as price
FROM users INNER JOIN 
(SELECT y.username, (advertisements.price*y.revenue_share)/advertisements.views_wanted as S, count(*) as ad_count
FROM advertisements INNER JOIN
		(SELECT x.username,x.revenue_share,vi.ad_shown,vi.viewed_at
		FROM views vi INNER JOIN
			(SELECT p.username, p.revenue_share, v.video_id, v.uploaded_at
			FROM partners p INNER JOIN videos v
			ON p.username=v.uploaded_by) x
		ON vi.video=x.video_id
		WHERE YEAR(DATE(vi.viewed_at))='2012' AND MONTH(DATE(vi.viewed_at))='06') y 
ON advertisements.ad_id = y.ad_shown
GROUP BY y.ad_shown, y.username) k
ON users.username = k.username
ORDER BY s*ad_count DESC
LIMIT 3;