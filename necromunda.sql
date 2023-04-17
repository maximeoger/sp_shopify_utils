SELECT DISTINCT p.`id_product`  AS `id_product`,
 pl.`link_rewrite` AS `Handle`,
 pl.`name` AS `Title`,
 pl.`meta_title` AS `SEO Title`,
 pl.`meta_description` AS `SEO Description`,
 pl.`description` AS `Body (HTML)`,
 p.`reference`  AS `Sku`,
 FORMAT(p.`price`, 2, 'fr_FR')  AS `Price`,
 'active'  AS `Status`,
 'Jeux De Figurines' AS `Product Type`,
 'Games Workshop'  AS `Vendor`,
 'Necromunda' AS `Collection`,
 CONCAT('https://www.starplayer.fr/',i.id_image,'-large_default/',pl.link_rewrite,'.jpg') AS `Image Src`,
 '1' AS `Image Position`,
 '' AS `Barcode`,
 'FALSE'  AS `is_virtual`,
 'TRUE' AS `Requires Shipping`,
 'TRUE' AS `Taxable`,
 sav.`quantity`  AS `sav_quantity`,
 IF(sav.`quantity`<=0, 1, 0) AS `badge_danger`,
 cp.`position`  AS `position` 
FROM  `product` p 
 LEFT JOIN `product_lang` pl ON (pl.`id_product` = p.`id_product` AND pl.`id_lang` = 2 AND pl.`id_shop` = 1) 
 LEFT JOIN `stock_available` sav ON (sav.`id_product` = p.`id_product` AND sav.`id_product_attribute` = 0 AND sav.id_shop = 1  AND sav.id_shop_group = 0 ) 
 JOIN `product_shop` sa ON (p.`id_product` = sa.`id_product` AND sa.id_shop = 1) 
 LEFT JOIN `category_lang` cl ON (sa.`id_category_default` = cl.`id_category` AND cl.`id_lang` = 2 AND cl.id_shop = 1) 
 LEFT JOIN `category` c ON (c.`id_category` = cl.`id_category`) 
 LEFT JOIN `shop` shop ON (shop.id_shop = 1) 
 LEFT JOIN `image_shop` image_shop ON (image_shop.`id_product` = p.`id_product` AND image_shop.`cover` = 1 AND image_shop.id_shop = 1) 
 LEFT JOIN `image` i ON (i.`id_image` = image_shop.`id_image`) 
 LEFT JOIN `product_download` pd ON (pd.`id_product` = p.`id_product`) 
 INNER JOIN `category_product` cp ON (cp.`id_product` = p.`id_product` AND cp.`id_category` = 362) 
WHERE (1 AND state = 1)
 
ORDER BY  `position` desc,  `id_product` asc
 
LIMIT 0, 300
;