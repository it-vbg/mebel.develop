<?
$con = mysqli_connect("localhost","root","","mebel_furniture");

if (!$con->set_charset("utf8")) {
	printf("Error loading character set utf8: %s\n", $con->error);
}

date_default_timezone_set('Europe/Chisinau');
?>