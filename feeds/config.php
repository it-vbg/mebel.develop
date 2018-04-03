<?php
/**
 * Created by PhpStorm.
 * User: Envision
 * Date: 12.03.2018
 * Time: 14:48
 */
date_default_timezone_set('Europe/Moscow');
//ini_set('display_errors','on');
//ini_set('error_reporting','E_ALL');
//error_reporting (E_ALL);

$link = mysqli_connect('localhost','mebel_furniture','dtxJEvHGAKFe6rj6','mebel_furniture'); //Соедиенение с базой
//mysqli_query('set names cp1251');

function clean($value = "") {

    $value = preg_replace("~&lt;~", '<', $value);
    $value = preg_replace("~&gt;~", '>', $value);
    $value = trim($value);
    $value = stripslashes($value);
    $value = strip_tags($value);
    $value = htmlspecialchars($value);
    $value = str_replace(array("\r","\n"),"",$value);
    $value = preg_replace("~&amp;nbsp;~", ' ', $value);
    $value = preg_replace("~&amp;amp;nbsp;~", ' ', $value);
    $value = preg_replace("~&amp;quot;~", '', $value);
    $value = preg_replace("~&amp;amp;quot;~", '', $value);
    $value = preg_replace("~&amp;mdash;~", '-', $value);
    $value = preg_replace("~&amp;ndash;~", '-', $value);
    $value = preg_replace("~&amp;amp;ndash;~", '-', $value);
    $value = preg_replace("~&amp;amp;mdash;~", '-', $value);
    $value = preg_replace("~&amp;laquo;~", '', $value);
    $value = preg_replace("~&amp;reg;~", '', $value);
    $value = preg_replace("~&amp;deg;~", '', $value);
    $value = preg_replace("~&amp;amp;laquo;~", '', $value);
    $value = preg_replace("~&amp;raquo;~", '', $value);
    $value = preg_replace("~&amp;amp;raquo;~", '', $value);


    return $value;
}
