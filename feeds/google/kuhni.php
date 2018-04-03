<?php
/**
 * Created by PhpStorm.
 * User: IT-Vbg
 * Date: 12.03.2018
 * Time: 14:48
 * for Opencart 2.3
 */
include_once '../config.php';
?>
<?php
echo "<?xml version=\"1.0\"?>\n";
echo "<rss xmlns:g=\"http://base.google.com/ns/1.0\" version=\"2.0\">\n";
    echo "\t<channel>\n";
        echo "\t\t<title>Mebel Furniture</title>\n";
        echo "\t\t<description>Интернет-магазин мебели mebel.furniture - качественная и современная мебель! Собственное производство, изготовление мебели под заказ!</description>\n";
        echo "\t\t<link>https://mebel.furniture/</link>\n";
        $array_items = mysqli_query ($link,"
            SELECT
              oc_product_description.name,
              oc_product.price,
              oc_url_alias.keyword,
              oc_product.image,
              oc_product.model,
              oc_product_description.description,
              oc_product.product_id,
              oc_product_special.price AS special,
              oc_product_to_category.main_category,
              oc_product_to_category.category_id,
              oc_category_description.name AS category_name
            FROM oc_product
              INNER JOIN oc_product_to_category
                ON oc_product.product_id = oc_product_to_category.product_id
              INNER JOIN oc_product_description
                ON oc_product.product_id = oc_product_description.product_id
              INNER JOIN oc_url_alias
                ON oc_url_alias.query LIKE CONCAT('product_id=', oc_product.product_id)
              INNER JOIN oc_category_description
                ON oc_product_to_category.category_id = oc_category_description.category_id
              LEFT OUTER JOIN oc_product_special
                ON oc_product.product_id = oc_product_special.product_id
            WHERE oc_product_to_category.category_id = 120
            OR oc_product_to_category.category_id = 115
            OR oc_product_to_category.category_id = 121
            AND oc_product.price > 0
            AND oc_product.status = 1
            GROUP BY oc_product.product_id    
        ");
            while($item = mysqli_fetch_array($array_items))
            {
                if (strpos($item['name'], 'Мойка') === false) {// именно через жесткое сравнение
                    echo "\t\t<item>\n";
                    echo "\t\t\t<g:id><![CDATA[" . $item['model'] . "]]></g:id>\n";
                    echo "\t\t\t<g:title><![CDATA[" . $item['name'] . "]]></g:title>\n";
                    echo "\t\t\t<g:description>" . clean($item['description']) . "</g:description>\n";
                    echo "\t\t\t<g:link>https://mebel.furniture/kuxni/" . $item['keyword'] . "</g:link>\n";
                    echo "\t\t\t<g:image_link>https://mebel.furniture/image/cache/" . str_replace(".jpg", "-1800x1350.jpg", $item['image']) . "</g:image_link>\n";
                    if ($item['special']){
                        echo "\t\t\t<g:price>".number_format($item['price'], 2, '.', '')." RUB</g:price>\n";
                        echo "\t\t\t<g:sale_price>".number_format($item['special'], 2, '.', '')." RUB</g:sale_price>\n";
                    } else {
                        echo "\t\t\t<g:price>".number_format($item['price'], 2, '.', '')." RUB</g:price>\n";
                    }
                    echo "\t\t\t<g:brand>Вента Мебель</g:brand>\n";
                    echo "\t\t\t<g:condition>new</g:condition>\n";
                    echo "\t\t\t<g:availability>preorder</g:availability>\n";
                    echo "\t\t\t<g:google_product_category>6347</g:google_product_category>\n";
                    echo "\t\t\t<g:product_type>".$item['category_name']."</g:product_type>\n";

                    echo "\t\t</item>\n";
                }
            }
    echo "\t</channel>\n";
echo "</rss>\n";
?>