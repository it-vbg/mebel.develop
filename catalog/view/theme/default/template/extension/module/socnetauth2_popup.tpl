<? if( $show_socauth2_popup ) { ?>
<div>
<style>
#socAuthOverlay {
    background: none repeat scroll 0 0 #fff;
    height: 100%;
    position: fixed;
    width: 100%; 
	left: 0;
    overflow: hidden;
    top: 0;
    z-index: 99;
}

#socAuthPopUp {
    background: none repeat scroll 0 0 #fff;
    border: 1px solid #DFDFDF;
	box-shadow: 0px 0px 10px #DFDFDF;
    z-index: 999;
	
	position: fixed;
	width: 517px;
	
	-moz-border-radius: 15px;
	border-radius: 15px;
	padding-top: 28px;
}

#socAuthPopUp table td {
	padding: 10px;
}

#socAuthPopUp .header
{
	text-align: center;
	padding: 0px;
	font-size: 30px;
	line-height: 28px;
}

#socAuthPopUp .skipp
{
	padding-top: 18px;

}

#socAuthPopUp .skiplink
{
	color: #000;
	text-decoration: none;
	font-size: 25px;
}

a.socnetauth_buttons:hover img
{
	opacity: 0.8;
}

</style>
<div id="socAuthOverlay" style="display: none; opacity: 0.9;"></div>
<div id="socAuthPopUp" style="display: none;">
<p class="header"><? echo $heading_title1; ?></p>
<p style="height: 4px;"></p>

<?php if( count($services) <= 4 ) { ?>

<table width=100%>
	<tr>
		<td width=4%></td>
<?php foreach( $services as $service_key=>$short ) { ?>
		<td width=30% align=center><a class="socnetauth_buttons" href="/socnetauth2/<?php echo $service_key; ?>.php?first=1"><img src="/socnetauth2/icons/<?php echo $short; ?>.png"></a></td>
<?php } ?>
		<td width=4%></td>
	</tr>
</table>
<?php } else { ?>

<table width=100%>
	<tr>
		<td width=4%></td>
<?php $i = 0; foreach( $services as $service_key=>$short ) { $i++;
if( $i > 3  ) continue;
?>
		<td width=30% align=center><a class="socnetauth_buttons" href="/socnetauth2/<?php echo $service_key; ?>.php?first=1"><img src="/socnetauth2/icons/<?php echo $short; ?>.png"></a></td>
<?php } ?>
		<td width=4%></td>
	</tr>
	<tr>
		<td width=4%></td>
<?php $i = 0; foreach( $services as $service_key=>$short ) { $i++;
if( $i <= 3 ) continue;
?>
		<td width=30% align=center><a class="socnetauth_buttons" href="/socnetauth2/<?php echo $service_key; ?>.php?first=1"><img src="/socnetauth2/icons/<?php echo $short; ?>.png"></a></td>
<?php } ?>
		<td width=4%></td>
	</tr>
</table>
<?php } ?>

<p align=center class="skipp"><i><a href="javascript: closeSocAuthPopUp();" class="skiplink"><? echo $text_skip; ?></a></i></p>
</div>
<script>
function show_socauth_popup()
{
	<?php if( $socnetauth2_mobile_control ) { ?>
	if( $(window).width()<520 ) return;
	<?php } ?>
	
	var otstup1 = ($(window).width() - 517)/2;
	var otstup2 = ($(window).height() - 420)/2;
	
	document.getElementById('socAuthPopUp').style.left    = otstup1+'px';
	document.getElementById('socAuthPopUp').style.top     = otstup2+'px';
	document.getElementById('socAuthPopUp').style.display = 'block';
	document.getElementById('socAuthOverlay').style.display = 'block';
}

function closeSocAuthPopUp()
{
	document.getElementById('socAuthPopUp').style.display = 'none';
	document.getElementById('socAuthOverlay').style.display = 'none';
	setCookie('show_socauth2_popup','1');
}

function setCookie( c_name, value, exdays )
{
	var exdate=new Date();
	exdate.setDate(exdate.getDate() + exdays);
	var c_value=escape(value) + ((exdays==null) ? "" : "; expires="+exdate.toUTCString());
	document.cookie=c_name + "=" + c_value;
}


show_socauth_popup();
</script>
</div>
<? } ?>