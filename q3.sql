USE VideoSharing;

SELECT u.name as Full_Names
FROM users u INNER JOIN 
	(SELECT advertiser, views_wanted, viewed
	FROM 
		(SELECT a.advertiser, a.views_wanted, count(*) as viewed
		FROM advertisements a INNER JOIN views v 
		ON a.ad_id = v.ad_shown GROUP BY v.ad_shown) t1
		WHERE t1.views_wanted<t1.viewed GROUP BY t1.advertiser) x
ON u.username = x.advertiser ;