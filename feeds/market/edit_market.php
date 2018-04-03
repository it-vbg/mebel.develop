<?php

ini_set('display_errors','on');
ini_set('error_reporting','E_ALL');
include '../configuration.php';
$cfg = new JConfig();

$hostname 				= $cfg->host;
$username 				= $cfg->user;
$password 				= $cfg->password;
$dbName 				= $cfg->db;
mysql_connect($hostname,$username,$password) OR DIE("Не могу создать соединение ");
mysql_select_db($dbName) or die(mysql_error());
mysql_query('set names cp1251');

$prefix = "s2mp1" ; // $prefix = "svd8p" ; 


$cat = '';
$limit=10;

if (isset($_GET['limit'])) { $limit =  intval($_GET['limit']); setcookie("limit", $_GET['limit'], time()+3600); }
elseif (isset($_COOKIE['limit'])) $limit = $_COOKIE['limit'];
if (isset($_GET['cat'])) { $cat = $_GET['cat']; setcookie("cat", $_GET['cat'], time()+3600); }
elseif (isset($_COOKIE['cat'])) $cat = $_COOKIE['cat'];

$page = (isset($_GET['page'])) ? intval($_GET['page']) : 1;

if (isset($_GET['del'])) mysql_query("delete from yandex where product_id='".$_GET['del']."'");
if (isset($_GET['ins'])) mysql_query("insert into yandex values ('','".$_GET['ins']."')");

if (!$cat) {
	$sql = "SELECT products.`product_id`, products.`name_ru-RU`,pc.category_id, cat.`name_ru-RU` as catname FROM ".$prefix."_jshopping_products as products  
			LEFT JOIN ".$prefix."_jshopping_products_to_categories as pc ON pc.product_id = products.product_id 
			LEFT JOIN ".$prefix."_jshopping_categories as cat ON pc.category_id = cat.category_id WHERE products.product_price>0 ORDER BY cat.category_id ASC";
} else {
	$sql = "SELECT products.`product_id`, products.`name_ru-RU`,pc.category_id, cat.`name_ru-RU` as catname FROM ".$prefix."_jshopping_products as products  
		LEFT JOIN ".$prefix."_jshopping_products_to_categories as pc ON pc.product_id = products.product_id 
		LEFT JOIN ".$prefix."_jshopping_categories as cat ON pc.category_id = cat.category_id WHERE products.product_price>0 AND cat.category_id=".$cat." ORDER BY cat.category_id ASC";
}
$targetpage = '';
$res = mysql_query($sql);
$total_pages = mysql_num_rows($res);
$stages = 3;
if($page) $start = ($page - 1) * $limit; 
else $start = 0;	
if ($page == 0) $page = 1;

	$prev = $page - 1;	
	$next = $page + 1;							
	$lastpage = ceil($total_pages/$limit);		
	$LastPagem1 = $lastpage - 1;					
	
	
	$paginate = '';
	if($lastpage > 1)
	{	
		$paginate .= "<div class='paginate'>";
		// Previous
		if ($page > 1){$paginate.= "<a href='$targetpage?page=$prev'>previous</a>";}
		else{$paginate.= "<span class='disabled'>previous</span>";	}

		if ($lastpage < 7 + ($stages * 2))	// Not enough pages to breaking it up
		{	
			for ($counter = 1; $counter <= $lastpage; $counter++)
			{
				if ($counter == $page){
					$paginate.= "<span class='current'>$counter</span>";
				}else{
					$paginate.= "<a href='$targetpage?page=$counter'>$counter</a>";}					
			}
		}
		elseif($lastpage > 5 + ($stages * 2))	// Enough pages to hide a few?
		{
			// Beginning only hide later pages
			if($page < 1 + ($stages * 2))		
			{
				for ($counter = 1; $counter < 4 + ($stages * 2); $counter++)
				{
					if ($counter == $page){
						$paginate.= "<span class='current'>$counter</span>";
					}else{
						$paginate.= "<a href='$targetpage?page=$counter'>$counter</a>";}					
				}
				$paginate.= "...";
				$paginate.= "<a href='$targetpage?page=$LastPagem1'>$LastPagem1</a>";
				$paginate.= "<a href='$targetpage?page=$lastpage'>$lastpage</a>";		
			}
			// Middle hide some front and some back
			elseif($lastpage - ($stages * 2) > $page && $page > ($stages * 2))
			{
				$paginate.= "<a href='$targetpage?page=1'>1</a>";
				$paginate.= "<a href='$targetpage?page=2'>2</a>";
				$paginate.= "...";
				for ($counter = $page - $stages; $counter <= $page + $stages; $counter++)
				{
					if ($counter == $page){
						$paginate.= "<span class='current'>$counter</span>";
					}else{
						$paginate.= "<a href='$targetpage?page=$counter'>$counter</a>";}					
				}
				$paginate.= "...";
				$paginate.= "<a href='$targetpage?page=$LastPagem1'>$LastPagem1</a>";
				$paginate.= "<a href='$targetpage?page=$lastpage'>$lastpage</a>";		
			}
			// End only hide early pages
			else
			{
				$paginate.= "<a href='$targetpage?page=1'>1</a>";
				$paginate.= "<a href='$targetpage?page=2'>2</a>";
				$paginate.= "...";
				for ($counter = $lastpage - (2 + ($stages * 2)); $counter <= $lastpage; $counter++)
				{
					if ($counter == $page){
						$paginate.= "<span class='current'>$counter</span>";
					}else{
						$paginate.= "<a href='$targetpage?page=$counter'>$counter</a>";}					
				}
			}
		}
					
				// Next
		if ($page < $counter - 1){ 
			$paginate.= "<a href='$targetpage?page=$next'>next</a>";
		}else{
			$paginate.= "<span class='disabled'>next</span>";
			}
		$paginate.= "</div>";		
}
$sql .= " LIMIT $start, $limit";


$limits = array(10 => 10, 30=>30, 50=>50, 100 => 100, 300=> 300, 100000 => 'Все');

//echo $sql;
?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta charset="utf-8">
<title>Сортировка</title>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
<style>
	
body,td {
	font-family:Verdana, Geneva, sans-serif;
	font-size:12px;
	color:#666666;
	margin:0px;
}
	
.paginate {
font-family:Arial, Helvetica, sans-serif;
	padding: 3px;
	margin: 3px;
}

.paginate a {
	padding:2px 5px 2px 5px;
	margin:2px;
	border:1px solid #999;
	text-decoration:none;
	color: #666;
}
.paginate a:hover, .paginate a:active {
	border: 1px solid #999;
	color: #000;
}
.paginate span.current {
    margin: 2px;
	padding: 2px 5px 2px 5px;
		border: 1px solid #999;
		
		font-weight: bold;
		background-color: #999;
		color: #FFF;
	}
	.paginate span.disabled {
		padding:2px 5px 2px 5px;
		margin:2px;
		border:1px solid #eee;
		color:#DDD;
	}
	
	li{
		padding:4px;
		margin-bottom:3px;
		background-color:#FCC;
		list-style:none;}
		
	ul{margin:6px;
	padding:0px;}	
	
	ul.tbl {
		width:500px;
		background-color:#d0d0d0;
		margin:2px;
	}
	span.row1 {
		width:300px;
		float:left;
	}
	span.row2 {
		width:100px;
		clear:both;
	}
</style>
<script>
	$(document).ready(function(){
		$("select#cat").change(function(){
       		$("#form_filter").submit();
        });
		$("#limit").change(function(){
       		$("#form_filter").submit();
        });
	});
</script>
</head>

<body>
<form id="form_filter" method="get" autocomplete = "off">
<table><tr><td>
<div>Раздел: <select name='cat' id='cat'><option value=''>Не важно</option>";<?
$cats_rh_cat = mysql_query ("SELECT category_id, `name_ru-RU` FROM ".$prefix."_jshopping_categories");

if (mysql_num_rows($cats_rh_cat)>0) {
	while ($catdata = mysql_fetch_array($cats_rh_cat))	{
		?><option  value="<?=$catdata["category_id"];?>"<? if ($catdata["category_id"]==$cat) echo " selected"; ?>><?=iconv('windows-1251','utf-8',$catdata["name_ru-RU"]);?></option><?
	}
}
?>
</select></div>
</td>
<td><div>Записей на стр: 
<select name='limit' id='limit'>
<? foreach ($limits as $k => $v) {
	$sel = '';
	if ($limit == $k) $sel =" selected";
	echo "<option value='".$k."'".$sel.">".$v."</option>";
} ?>
</select>
</div></td>	
</tr></table>
<hr>
<?


echo $paginate;

$curdir = '';
$array_tovar=mysql_query($sql);
?>
<ul class="tbl">
<?
while($row_tovar=mysql_fetch_array($array_tovar)) {
	$array_tovar_yandex=mysql_query("SELECT * FROM yandex WHERE product_id='".$row_tovar['product_id']."'");
	if ($row_tovar_yandex=mysql_fetch_array($array_tovar_yandex)) $bcolor="#ffff00";
	else $bcolor="#ffffff";
	if ($curdir != $row_tovar['category_id']) {
		if ($curdir!='') echo "</ul></li>";
		echo "<li><strong>".iconv('windows-1251','utf-8',$row_tovar['catname'])."</strong><ul class='row'>";
		$curdir = $row_tovar['category_id'];
	}
	echo "<li style='background-color:".$bcolor."'><span class='row1'>".iconv('windows-1251','utf-8',$row_tovar['name_ru-RU'])."</span><span class='row2'>".(($bcolor!='#ffffff') ? "<a href='?del=".$row_tovar['product_id']."&page=".$page."'>Снять размещение</a>" : "<a href='?ins=".$row_tovar['product_id']."&page=".$page."'>Разместить</a>")."</span></li>\n";
}	
?>

</li></ul></ul>
<?
echo $paginate;
?>
<button type="submit">Применить</button>
</form>
</body></html>
