<?php
header ('Content-type: text/html; charset=windows-1251');
define ("COLLATE", "windows-1251");
include_once 'config.php';

echo"<?xml version=\"1.0\" encoding=\"cp1251\"?>\n";
echo"<!DOCTYPE yml_catalog SYSTEM \"shops.dtd\">\n";
echo"<yml_catalog date=\"";
echo date('Y-m-d H:i');
echo"\">\n";
echo"<shop>\n";
echo"<name>$cfg_name</name>\n";
echo"<company>$cfg_company</company>\n";
echo"<url>$cfg_url</url>\n";


echo"<currencies>\n";
echo"<currency  id=\"RUR\" rate=\"1\"/>\n";
echo"<currency  id=\"USD\" rate=\"CBRF\"/>\n";
echo"<currency  id=\"EUR\" rate=\"CBRF\"/>\n";
echo"</currencies>\n";

?>


<?php
echo"<categories>\n";

$array_category=mysql_query("select * from s2mp1_jshopping_categories where category_publish='1'");
 while($row_category=mysql_fetch_array($array_category))
{
	if ($row_category['category_parent_id']=='0')	echo"<category id=\"".$row_category['category_id']."\">".$row_category['name_ru-RU']."</category>\n";

	if ($row_category['category_parent_id']!='0')	echo"<category id=\"".$row_category['category_id']."\" parentId=\"".$row_category['category_parent_id']."\">".$row_category['name_ru-RU']."</category>\n";
}
echo"</categories>\n";
?>

<?php
echo"<offers>\n";


$array_tovar=mysql_query("
SELECT
  s2mp1_jshopping_products.product_id,
  s2mp1_jshopping_products.`alias_ru-RU`,
  s2mp1_jshopping_products.`name_ru-RU`,
  s2mp1_jshopping_products.product_price,
  s2mp1_jshopping_categories.category_id,
  s2mp1_jshopping_categories.`alias_ru-RU`,
  s2mp1_jshopping_products.image
FROM s2mp1_jshopping_products
  INNER JOIN s2mp1_jshopping_products_to_categories
    ON s2mp1_jshopping_products.product_id = s2mp1_jshopping_products_to_categories.product_id
  INNER JOIN s2mp1_jshopping_categories
    ON s2mp1_jshopping_categories.category_id = s2mp1_jshopping_products_to_categories.category_id
WHERE s2mp1_jshopping_products.product_publish = 1
GROUP BY s2mp1_jshopping_products.product_id

");
while($row_tovar=mysql_fetch_array($array_tovar))
{


		$item ="\n<offer id=\"".$row_tovar['product_id']."\" available=\"true\" bid=\"$bid\">\n";
		
        $item .="<url>http://automobile-gadgets.ru/".$row_tovar['alias_ru-RU']."/".$row_tovar['1'].".html</url>\n";
		$item .="<price>".$row_tovar['product_price']."</price>\n";
		$item .="<currencyId>RUR</currencyId>\n";		
		$item .="<categoryId>".$row_tovar['category_id']."</categoryId>\n";	
		$item .="<picture>http://automobile-gadgets.ru/photo/".$row_tovar['image']."</picture>\n";
		$item .="<name>".$row_tovar['name_ru-RU']."</name>\n";
		$item .="<pickup>true</pickup>\n";
		$item .="<delivery>true</delivery>\n";
		$item .="<manufacturer_warranty>true</manufacturer_warranty>\n";
		$item .="</offer>\n";
	    echo $item;
}
echo"</offers>\n";
?>
<?php
echo"</shop>\n";
echo"</yml_catalog>\n";
?>