<?php
date_default_timezone_set('Europe/Moscow');
//ini_set('display_errors','on');
//ini_set('error_reporting','E_ALL');
//error_reporting (E_ALL);
mysql_connect('localhost','root','') OR DIE("Error");
mysql_select_db('mebel_furniture') or die(mysql_error());
mysql_query('set names cp1251');

function clean($value = "") {
    $value = trim($value);
    $value = stripslashes($value);
    $value = strip_tags($value);
    $value = htmlspecialchars($value); 
	$value=str_replace(array("\r","\n"),"",$value);   
    return $value;
}
$cfg_name = 'automobile-gadgets';
$cfg_company = 'automobile-gadgets';
$cfg_url = 'http://automobile-gadgets.ru/';
$bid = '10';
$salesnotes = 'Нал/безнал, карты, Qiwi';
$salesnotes_rus = iconv("utf-8","windows-1251",$salesnotes);

?>