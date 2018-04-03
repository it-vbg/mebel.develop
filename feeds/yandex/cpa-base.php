<?php
/**
 * Created by PhpStorm.
 * User: IT-Vbg
 * Date: 12.03.2018
 * Time: 14:48
 * for Opencart 2.3
 */
include_once '../config.php';

//ID категорий которые выгружаем в партнерки
$category_id = array(120,115,121,95);

$current_dade = date('Y-m-d H:i');


?>
<?php
echo "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n";
echo "<yml_catalog date=\"$current_dade\">\n";
echo "\t<shop>\n";
echo "\t<name>Mebel Furniture</name>\n";
echo "\t<company>Вента-Мебель</company>\n";
echo "\t<url>https://mebel.furniture/</url>\n";
echo "\t<currencies>\n";
    echo "\t\t<currency id=\"RUR\" rate=\"1\"/>\n";
echo "\t</currencies>\n";

echo "\t<categories>\n";

$array_category = mysqli_query ($link, "
SELECT
  oc_category.category_id,
  oc_category.parent_id,
  oc_category_description.name
FROM oc_category
  INNER JOIN oc_category_description
    ON oc_category.category_id = oc_category_description.category_id
");

while($row_category=mysqli_fetch_array($array_category))
{
    if ($row_category['parent_id']=='0')	echo"\t\t<category id=\"".$row_category['category_id']."\">".$row_category['name']."</category>\n";

    if ($row_category['parent_id']!='0')	echo"\t\t<category id=\"".$row_category['category_id']."\" parentId=\"".$row_category['parent_id']."\">".$row_category['name']."</category>\n";
}
echo "\t</categories>\n";
echo "\t<cpa>0</cpa>\n";
echo "\t<offers>\n";

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
            
            WHERE oc_product_to_category.category_id IN (".implode(',',$category_id).")
            AND oc_product.price > 0
            AND oc_product.status = 1
            GROUP BY oc_product.product_id          
        ");
            while($item = mysqli_fetch_array($array_items))
            {
                echo "\t\t<offer id=";
                echo '"'.$item['product_id'].'"';
                echo " available=\"false\" bid=\"30\" cbid=\"30\" fee=\"100\">\n";

                    //print_r($item);
                    //echo "\t\t\t<typePrefix>Кухня</typePrefix>\n";
                    //echo "\t\t\t<model>".$item['model']."</model>\n";
                    echo "\t\t\t<name>".$item['name']."</name>\n";
                    echo "\t\t\t<categoryId>".$item['category_id']."</categoryId>\n";
                    echo "\t\t\t<vendor>Вента Мебель</vendor>\n";
                    echo "\t\t\t<url>https://mebel.furniture/".$item['keyword']."</url>\n";
                    echo "\t\t\t<picture>https://mebel.furniture/image/cache/".str_replace(".jpg", "-1800x1350.jpg", $item['image'])."</picture>\n";
                    if ($item['special']){
                        echo "\t\t\t<price>".number_format($item['special'], 2, '.', '')."</price>\n";
                        echo "\t\t\t<oldprice>".number_format($item['price'], 2, '.', '')."</oldprice>\n";
                    } else {
                        echo "\t\t\t<price>".number_format($item['price'], 2, '.', '')."</price>\n";
                    }
                    echo "\t\t\t<currencyId>RUR</currencyId>\n";
                    echo "\t\t\t<description>".clean($item['description'])."</description>\n";
                    echo "\t\t\t<country_of_origin>Россия</country_of_origin>\n";
                    echo "\t\t\t<manufacturer_warranty>true</manufacturer_warranty>\n";
                    echo "\t\t\t<pickup>true</pickup>\n";
                    echo "\t\t\t<sales_notes>Наличные, безнал, рассрочка.</sales_notes>\n";


                    //echo "\t\t\t<title><![CDATA[".$item['name']."]]></title>\n";



                echo "\t\t</offer>\n";
            }
    echo "\t</offers>\n";
    echo "\t</shop>\n";
echo "</yml_catalog>\n";

?>