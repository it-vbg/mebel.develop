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


echo"<categories>\n";

$array_category=mysql_query("select * from s2mp1_jshopping_categories where category_publish='1'");
 while($row_category=mysql_fetch_array($array_category))
{
	if ($row_category['category_parent_id']=='0')	echo"<category id=\"".$row_category['category_id']."\">".$row_category['name_ru-RU']."</category>\n";

	if ($row_category['category_parent_id']!='0')	echo"<category id=\"".$row_category['category_id']."\" parentId=\"".$row_category['category_parent_id']."\">".$row_category['name_ru-RU']."</category>\n";
}
echo"</categories>\n";


echo"<offers>\n";


$array_tovar=mysql_query("select * from s2mp1_jshopping_products where product_price>'7000'");
 while($row_tovar=mysql_fetch_array($array_tovar))
{


$test=0;
$array_tovar_yandex=mysql_query("select * from yandex where product_id='".$row_tovar['product_id']."'");
 while($row_tovar_yandex=mysql_fetch_array($array_tovar_yandex))
{$test=1;}

if ($test=='1'){
$pd="";
$al="";
$result340=mysql_query("select * from s2mp1_jshopping_products_to_categories where product_id='".$row_tovar['product_id']."'");
while($row340=mysql_fetch_array($result340))
{$pd=$row340['category_id'];

$result341=mysql_query("select * from s2mp1_jshopping_categories where category_id='".$pd."'");
while($row341=mysql_fetch_array($result341))
{$al=$row341['alias_ru-RU'];}

}
		
		echo"\n<offer id=\"".$row_tovar['product_id']."\" available=\"true\" bid=\"$bid\">\n";
		
        echo"<url>http://automobile-gadgets.ru/".$al."/".$row_tovar['alias_ru-RU'].".html</url>\n";
		echo"<price>".$row_tovar['product_price']."</price>\n";

		echo"<currencyId>RUR</currencyId>\n";
		echo"<categoryId>".$pd."</categoryId>\n";
		
		
		echo"<picture>http://automobile-gadgets.ru/photo/".$row_tovar['image']."</picture>\n";

		//echo"<delivery>true</delivery> \n";
		/*$row[$i]['product_name']=str_replace ('"','&quot;', $row[$i]['product_name']);
		$row[$i]['product_name']=str_replace ('&','&amp;', $row[$i]['product_name']);
		$row[$i]['product_name']=str_replace ('>','&gt;', $row[$i]['product_name']);
		$row[$i]['product_name']=str_replace ('<','&lt;', $row[$i]['product_name']);
		$row[$i]['product_name']=str_replace ('\'','&apos;', $row[$i]['product_name']);
*/
		echo"<name>".strip_tags($row_tovar['name_ru-RU'])."</name>\n";
		echo"<description>".strip_tags($row_tovar['short_description_ru-RU'])."</description>\n";
		echo"<manufacturer_warranty>true</manufacturer_warranty>\n";
		echo"<store>false</store>\n";
  		echo"<pickup>true</pickup>\n";
  		echo"<delivery>true</delivery>\n";
		echo"<sales_notes>".$salesnotes_rus."</sales_notes>\n";

    	echo"</offer>\n";
}}

echo"</offers>\n";
echo"</shop>\n";
echo"</yml_catalog>\n";

function d2a($query){
    $result = mysql_query($query) or die("Query failed : " . mysql_error());
    while ($line = mysql_fetch_array($result, MYSQL_ASSOC)) {$res[] = $line;}
    mysql_free_result($result);
    return $res;
}




?>
