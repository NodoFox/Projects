USE VideoSharing;

SELECT ad_target_categories.category, sum(advertisements.price) AS category_price
FROM advertisements INNER JOIN ad_target_categories
ON advertisements.ad_id = ad_target_categories.ad_id
GROUP BY ad_target_categories.category;