USE VideoSharing;

SELECT advertisements.ad_id AS advertisementID,users.name, users.email
FROM advertisements INNER JOIN users
ON advertisements.advertiser = users.username
WHERE (1000*advertisements.price)/advertisements.views_wanted <0.07;