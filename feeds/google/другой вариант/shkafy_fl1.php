<?php
/**
 * Created by PhpStorm.
 * User: IT-Vbg
 * Date: 12.03.2018
 * Time: 14:48
 * for Opencart 2.3
 */
include_once 'config_fl1.php';
?>
<?php
echo "<?xml version=\"1.0\" encoding=\"UTF-8\" ?>\n";
echo "<rss version=\"2.0\" xmlns:g=\"http://base.google.com/ns/1.0\">\n";
echo "<channel>\n";
echo "<title>Mebel Furniture</title>\n";
echo "<description>Интернет-магазин мебели mebel.furniture - качественная и современная мебель! Собственное производство, изготовление мебели под заказ!</description>\n";
echo "<link>https://mebel.furniture/</link>\n";


$sel_wk = $con->query("SELECT *
  FROM oc_product p, oc_product_description d, oc_product_to_category c
  WHERE p.product_id = d.product_id AND p.product_id = c.product_id AND p.price > 0 AND p.status = 1");

while($row = $sel_wk->fetch_array(MYSQLI_ASSOC)) {
  $id_prod = 'product_id='.$row['product_id'];
  $sel_key = $con->query("SELECT * FROM oc_url_alias WHERE query = '$id_prod'");
  $key_row = $sel_key->fetch_array(MYSQLI_ASSOC);

  echo $key_row['keyword'].'<br>';
    echo "<item>\n";
        echo "\t<g:title><![CDATA[".$row['name']."]]></g:title>\n";
        echo "\t<g:price>".number_format($row['price'], 2, '.', '')." RUB<g:price>\n";
        echo "\t<g:condition>new</g:condition>\n";
        echo "\t<g:availability>preorder</g:availability>\n";

    echo "<item>\n";
}
echo "</channel>\n";
echo "</rss>\n";
?>