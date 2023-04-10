SELECT SQL_CALC_FOUND_ROWS 
  -- p.`reference` AS `sku`, -- variant SKU
  -- p.`price` AS `variant_price`, -- variant price
  -- pl.`name` AS `title`, -- title
  -- pl.`link_rewrite` AS `handle`, -- handle
  -- sa.`active` AS `published`, -- published
  -- shop.`name` AS `vendor`, -- vendor
  image_shop.`id_image` AS `id_image`,
  p.reference AS product_reference, 

  CONCAT('https://www.starplayer.fr/',pi.id_image,'-large_default',pl.link_rewrite, '.jpg') AS image_url
  

  --cl.`name` AS `name_category`,
  --0 AS `price_final`,
  --pd.`nb_downloadable`  AS `nb_downloadable`,
  --sav.`quantity`  AS `sav_quantity`,
  --IF(sav.`quantity`<=0, 1, 0) AS `badge_danger`,
  --cp.`position`  AS `position` 
FROM  `product` p 
--  LEFT JOIN `product_lang` pl ON (pl.`id_product` = p.`id_product` AND pl.`id_lang` = 2 AND pl.`id_shop` = 1) 
--  LEFT JOIN `stock_available` sav ON (sav.`id_product` = p.`id_product` AND sav.`id_product_attribute` = 0 AND sav.id_shop = 1  AND sav.id_shop_group = 0 ) 
--  JOIN `product_shop` sa ON (p.`id_product` = sa.`id_product` AND sa.id_shop = 1) 
--  LEFT JOIN `category_lang` cl ON (sa.`id_category_default` = cl.`id_category` AND cl.`id_lang` = 2 AND cl.id_shop = 1) 
--  LEFT JOIN `category` c ON (c.`id_category` = cl.`id_category`) 
--  LEFT JOIN `shop` shop ON (shop.id_shop = 1) 
--  LEFT JOIN `image_shop` image_shop ON (image_shop.`id_product` = p.`id_product` AND image_shop.`cover` = 1 AND image_shop.id_shop = 1) 
 -- LEFT JOIN `image` pi ON (p.`id_image` = image_shop.`id_image`)
LEFT JOIN `product_lang` pl ON (p.id_product = pl.id_product) 
LEFT JOIN `image` pi ON (p.id_product = pi.id_product and pi.cover = 1)
--  LEFT JOIN `product_download` pd ON (pd.`id_product` = p.`id_product`) 
--  INNER JOIN `category_product` cp ON (cp.`id_product` = p.`id_product` AND cp.`id_category` = 362) 
-- WHERE (1 AND state = 1)
 
ORDER BY  `position` desc,  `id_product` asc
 
LIMIT 0, 300
;
